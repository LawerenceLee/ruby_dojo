class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all
    render layout: "three_column"
  end
end
