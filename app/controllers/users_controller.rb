class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    @bookmarks = Bookmark.where(user_id: current_user.id).order('created_at')
  end
end