json.array!(@city_pages) do |city_page|
  json.extract! city_page, :id, :city, :country, :continent, :article, :g_map, :twitter_feed, :book_suggestion
  json.url city_page_url(city_page, format: :json)
end
