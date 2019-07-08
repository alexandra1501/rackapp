#require './lib/controller'

class PostsController < Controller

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(@request_parameters).save
  end


end

