class PostsController < Controller

  def create
    @post = Post.new(request_parameters).save
    @posts = Post.all
  end

end

