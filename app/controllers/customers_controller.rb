class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update destroy ]

  def index
    @customers = Customer.all
  end 

  def show; end

  def new
    @customer = Customer.new
  end

  def edit; end
    
  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to customer_url(@customer), notice: "Customer was successfully created." 
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to customer_url(@customer), notice: "Customer was successfully updated." 
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_path
  end
  
  private
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
        params.require(:customer).permit(:name, :plan, :value, :contact, :tasks)
    end
end