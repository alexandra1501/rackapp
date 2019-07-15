require 'test_helper'

class TestPostsController < Minitest::Test
  include Rack::Test::Methods

  def app
    builder = Rack::Builder.new
    builder.run App.new
  end

  def test_that_doesnt_get_the_wrong_page
    get "/hshshshs"
    assert last_response.not_found?
  end

  def test_that_gets_root_path
    get "/"
    assert last_response.ok?
  end

  def test_that_gets_to_create_path
    get "/create"
    assert last_response.ok?
  end

  def test_that_creates_object
    test = "hello i'm cute"
    post "/create", content: test
    result = Post.find(content: test)
    assert_equal result.content, test
  end

  def test_that_shows_create_response
    test = "i like you"
    get "/create", content: test
    result = Post.find(content: test)
    assert last_response.body.include?("Post was created")
  end

end
