class NotNullParsed < ActiveRecord::Migration
  def change
    Post.update_all({parsed: false})

    change_column :posts, :parsed, :boolean, null: false, default: false
  end
end
