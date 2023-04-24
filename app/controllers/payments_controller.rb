class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[ show edit update destroy change_status]

  def index
    @payments = Payment.all.order('created_at desc')
  end

  def show; end

  def new
    @payment = Payment.new
  end

  def edit; end
  
  def create 
    @payment = Payment.new(payment_params)
    
    if @payment.save
      redirect_to payment_url(@payment), notice: "Payment was successfully created."
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def update
    if @payment.update(payment_params)
      redirect_to payment_url(@payment), notice: "Payment was successfully updated." 
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
    @payment.destroy
    redirect_to payments_path
  end
  
  def change_status_from_customer
    @customer = Customer.find(params[:customer_id])
    @payment = @customer.payments.find(params[:id])
    switch_paid_value(@payment)
    redirect_to @customer, notice: "Payment status was successfully updated."
  end

  def change_status
    switch_paid_value(@payment)
    redirect_to payments_path, notice: "Payment status was successfully updated." 
  end

  private
    def switch_paid_value(payment)
      payment.update_attribute(:paid, !@payment.paid)
    end

    def set_payment
      @payment = Payment.find(params[:id])
    end

    def payment_params
      params.require(:payment).permit(:month, :name, :value, :paid, :customer_id)
    end
end
