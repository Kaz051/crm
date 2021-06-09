class PostsController < ApplicationController
  def create
    post = Post.create(post_params)
    render json:{ post: post }
  end

  private
  def post_params
    params.require(:post).permit(:text).merge(user_id: current_user.id)
  end
end