class PostsController < ApplicationController
  def create
    post = Post.create(post_params)
    redirect_to customers_path
  end

  private
  def post_params
    params.require(:post).permit(:text).merge(user_id: current_user.id)
  end
end