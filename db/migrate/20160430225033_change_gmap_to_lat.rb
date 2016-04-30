class ChangeGmapToLat < ActiveRecord::Migration
  def change
    rename_column :city_pages, :g_map, :lat
  end
end
