class HostToDomain < ActiveRecord::Migration
  def change
    rename_column :parsers, :host, :domain
  end
end
