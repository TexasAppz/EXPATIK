class AddColumnLon < ActiveRecord::Migration
  def change
    add_column :city_pages, :lon, :string 
  end
end
