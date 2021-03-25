class PostsController < ApplicationController
  before_action :signed_in_only, only: %i[new create]
  before_action :authenticate_user!, only: %i[new create]
  def new
    @post = current_user.posts.build
  end

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path, notice: 'Post was successfully created.'
    else
      render 'new'
    end
  end

  private

   def signed_in_only
    unless current_user
      flash[:error] = "You must be logged to proceed"
      redirect_to new_user_session_path
    end
   end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
