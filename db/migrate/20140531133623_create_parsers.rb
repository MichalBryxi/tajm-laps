class CreateParsers < ActiveRecord::Migration
  def change
    create_table :parsers do |t|
      t.string :name
      t.string :xpath

      t.timestamps
    end
  end
end
