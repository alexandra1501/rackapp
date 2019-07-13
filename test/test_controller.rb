require 'test_helper'

class TestMyController < Minitest::Test
  include Rack::Test::Methods

  def app
    builder = Rack::Builder.new
    builder.run App.new
  end

  def setup
    @controller = Controller.new("posts", "create", {content: ""})
  end

  def test_has_a_200_status
    get "/create"
    assert_equal 200, @controller.call.status
  end

  def test_has_a_404_status_if_not_found
    get "/hahaha"
    assert_equal 404, @controller.call.status
  end

  def has_no_header_if_not_found
    assert_equal nil, controller.not_found.headers
  end

  def has_a_text_if_not_found
    assert_equal 'Page is not found!', controller.not_found.content
  end

end
