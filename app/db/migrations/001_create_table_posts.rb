class CreateTablePosts < Sequel::Migration
  def up
    create_table :posts do
      primary_key :id
      String :content
    end
  end

  def down
    drop_table :posts
  end
end
