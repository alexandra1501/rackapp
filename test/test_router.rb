require 'test_helper'

class TestRouter < Minitest::Test
  include MyBuilder

  def test_responds_to_the_wrong_path
    get "/lala"
    assert_equal 404, last_response.status
  end

  def test_responds_to_the_right_path
    get "/create"
    assert_equal 200, last_response.status
  end

end
