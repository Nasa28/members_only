class PostsController < ApplicationController
  before_action  only: [:new, :create]
end
