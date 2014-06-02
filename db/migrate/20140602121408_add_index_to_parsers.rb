class AddIndexToParsers < ActiveRecord::Migration
  def change
    add_index :parsers, :domain, unique: true
  end
end
