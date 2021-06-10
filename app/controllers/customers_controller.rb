class CustomersController < ApplicationController
  before_action :authenticate_user!, except: :index

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

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_path
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path
    else
      render :edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:name)
  end

end
