class RemoveParsedFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :parsed
  end
end
