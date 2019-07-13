require 'test_helper'

class TestPostController < Minitest::Unit::TestCase

  def test_save_the_post
    post = Post.new({content: "haha"}).save
    assert_equal true, post.exists?
  end

end
