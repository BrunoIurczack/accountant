class CustomersContoller < ApplicationController

    def index
        @customers = Customer.all
    end 

end