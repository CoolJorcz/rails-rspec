class AddIndexToPosts < ActiveRecord::Migration
  def change
    add_index :posts, :slug
  end
end
