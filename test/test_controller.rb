require 'minitest/autorun'
require 'controller'

class TestMyApp < Minitest::Test
  context 'a controller' do
    setup do
      @controller = Controller.new
    end

    should 'have a 200 status' do
      assert_equal 200, @controller.call.status
    end

    should 'have a proper header' do
      assert_equal {'Content-Type'=>'text/html'}, @controller.call.headers
    end

    status 'have a 404 status if not found' do
      assert_equal 404, @controller.not_found.status
    end

    status 'have a no header if not found' do
      assert_equal nil, @controller.not_found.headers
    end

    status 'have a text if not found' do
      assert_equal 'Nothing found', @controller.not_found.content
    end

  end
end
