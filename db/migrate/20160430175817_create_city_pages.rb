class CreateCityPages < ActiveRecord::Migration
  def change
    create_table :city_pages do |t|
      t.string :city
      t.string :country
      t.string :continent
      t.string :article
      t.string :g_map
      t.string :twitter_feed
      t.string :book_suggestion

      t.timestamps null: false
    end
  end
end
