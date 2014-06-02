class RemoveSinceIdMaxIdPublishedFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :published
    remove_column :projects, :since_id
    remove_column :projects, :max_id
  end
end
