class CustomersController < ApplicationController
  def index
    @customers = Cusomer.all
  end
end
