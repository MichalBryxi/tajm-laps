class AddUrlToParser < ActiveRecord::Migration
  def change
    add_column :parsers, :url, :string
  end
end
