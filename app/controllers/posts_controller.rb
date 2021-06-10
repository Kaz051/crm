class PostsController < ApplicationController
  def create
    post = Post.create(post_params)
    render json:{ post: post }
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to customers_path
  end

  private
  def post_params
    params.require(:post).permit(:text).merge(user_id: current_user.id, user_name: current_user.name)
  end
end