class PostsController < Controller

  attr_reader :request_parameters

  def initialize(request_parameters)
    super
    @request_parameters = request_parameters
  end

  def index
    @posts = Post.all
  end

  def create
    @post = Post.create!(request_parameters)
  end


end

