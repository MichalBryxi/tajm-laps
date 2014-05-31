class AddParserIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :parser_id, :integer
  end
end
