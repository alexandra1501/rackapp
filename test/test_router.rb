require 'test_helper'

class TestRouter < Minitest::Test
  include Rack::Test::Methods

  def app
    builder = Rack::Builder.new
    builder.run App.new
  end

  def test_responds_to_the_wrong_path

  end
end
