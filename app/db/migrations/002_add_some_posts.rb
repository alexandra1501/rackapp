class AddSomePosts < Sequel::Migration
  def up
    Post.create(
    content: 'LALALALALAL'
    )
  end

  def down
  end
end
