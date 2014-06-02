class AddMaxIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :max_id, :integer, :limit => 8
  end
end
