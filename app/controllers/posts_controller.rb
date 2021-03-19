class PostsController < ApplicationController
  before_action  only: [:new, :create]
  
  def new
    @post = Post.new
  end
  
end
