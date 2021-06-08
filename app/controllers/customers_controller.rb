class CustomersController < ApplicationController
  def index
    @customers = Customer.all.order('name')

    @post = Post.new
    @posts = Post.order('created_at DESC')
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @customer = Customer.find(params[:id])
    @estimate = Estimate.new
    @estimates = @customer.estimates.includes(:user).order('created_at DESC')
  end

  private
  def customer_params
    params.require(:customer).permit(:name)
  end

end
