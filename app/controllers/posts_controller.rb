class PostsController < ApplicationController
  before_action  only: [:new, :create]

  def new
    @post = Post.new
  end
  
  def index
    @posts = Post.all
  end
 

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice:  "Post was successfully created."
    else
      render 'new'
  end

  private

  def post_params 
    params.require(:post).permit(:title, :body)

  end
end
