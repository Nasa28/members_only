class PostsController < ApplicationController
  before_action  only: [:new, :create]
  
  def new
    @post = current_user.posts.build
  end
  
  def index
    @posts = Post.all.order("created_at DESC")
  end
 
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path, notice:  "Post was successfully created."
    else
      render 'new'
    end
  end

  private


  def post_params 
    params.require(:post).permit(:title, :body)

  end
end
