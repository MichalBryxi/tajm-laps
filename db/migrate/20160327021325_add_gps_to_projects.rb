class AddGpsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :latitude, :float, null: false, default: 0.0
    add_column :projects, :longitude, :float, null: false, default: 0.0
  end
end
