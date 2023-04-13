class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[ show edit update destroy]

  def index
    @payment = Payment.all
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

  private
    def set_payment
        @payment = Payment.find(params[:id])
    end
end

