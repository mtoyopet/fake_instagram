class PostsController < ApplicationController
  def index
    @posts = Post.limit(10).includes(:photos)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    if params[:images]
      params[:image].each do |img|
        @post.save
        @post.photos.create(image: img)
        redirect_to root_path
        flash[:notice] = "Your post is saved"
      end
    else
      redirect_to root_path
      flash[:alert] = "Your post failed"
  end

  private

  def post_params
    params.require(:post).permit(:caption).merge(user_id: current_user.id)
  end
end
