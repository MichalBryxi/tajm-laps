class AddUidToPost < ActiveRecord::Migration
  def change
    add_column :posts, :uid, :integer, :limit => 8
  end
end
