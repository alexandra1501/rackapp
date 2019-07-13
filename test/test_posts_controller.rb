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

  def test_that_creates_object
    test = "haha"
#    get '/'
#    assert last_response.ok?

    post "/create", request_parameters: {content: "haha"}
    result = Post.find(content: test)
    assert_equal result.content, test
  end

end
