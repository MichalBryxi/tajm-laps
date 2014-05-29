class AddProjectIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :project_id, :integer
  end
end
