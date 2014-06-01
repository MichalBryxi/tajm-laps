class AddPostsCountToProject < ActiveRecord::Migration
  def change
    add_column :projects, :posts_count, :integer
  end
end
