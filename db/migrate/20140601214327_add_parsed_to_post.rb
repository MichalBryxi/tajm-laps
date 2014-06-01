class AddParsedToPost < ActiveRecord::Migration
  def change
    add_column :posts, :parsed, :boolean
  end
end
