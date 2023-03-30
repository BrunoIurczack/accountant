class CustomersController < ApplicationController
  before_action :set_customer, only: %i [ show edit update destroy ]

  def index
    @customers = Customer.all
  end 

  def show
  end

  def new
    @customer = Customer.new
  end

  def edit
  end
    
  def create
    @customer = Customer.new(customer_params)
  end

  def update
  end

  def destroy
  end

  private

    def set_customer
      @customers = Customer.find(params[:id])
    end
    def customer_params
        params.require(:customer).permit(:name, :plan, :value, :contact, :tasks, )
    end
end