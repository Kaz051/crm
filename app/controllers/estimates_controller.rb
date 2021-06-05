class EstimatesController < ApplicationController
  def create
    @estimate = Estimate.new(estimate_params)
    if @estimate.save
      redirect_to customer_path(@estimate.customer.id)
    else
      render :new
    end
  end

  private
  def estimate_params
    params.require(:estimate).permit(:item_name, :selling_price).merge(user_id: current_user.id, customer_id: params[:customer_id])
  end
end
