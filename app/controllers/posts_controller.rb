class PostsController < Controller

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(request_parameters).save unless request_parameters.empty?
  end

end

