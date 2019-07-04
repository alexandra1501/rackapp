require 'minitest/autorun'
require 'controller'

class TestMyApp < Minitest::Test
  context 'a controller' do
    setup do
      @controller = Controller.new
    end

    test 'have a 200 status' do
      assert_equal 200, @controller.call.status
    end

  end
end
