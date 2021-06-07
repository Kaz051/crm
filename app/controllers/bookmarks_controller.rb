class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @customer = Customer.find(params[:customer_id])
    bookmark = @customer.bookmarks.new(user_id: current_user.id)
    if bookmark.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @customer = Customer.find(params[:customer_id])
    bookmark = @customer.bookmarks.find_by(user_id: current_user.id)
    if bookmark.present?
        bookmark.destroy
        redirect_to request.referer
    else
        redirect_to request.referer
    end
  end
end