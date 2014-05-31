class UrlToHost < ActiveRecord::Migration
  def change
    rename_column :parsers, :url, :host
  end
end
