class AddCursorToProject < ActiveRecord::Migration
  def change
    add_column :projects, :cursor, :integer, :limit => 8
  end
end
