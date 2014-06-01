class AddSinceIdToProject < ActiveRecord::Migration
  def change
    add_column :projects, :since_id, :integer, :limit => 8
  end
end
