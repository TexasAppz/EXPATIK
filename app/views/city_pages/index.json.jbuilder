json.array!(@city_pages) do |city_page|
  json.extract! city_page, :id, :city, :country, :continent, :article, :lat, :twitter_feed, :book_suggestion, :lon
  json.url city_page_url(city_page, format: :json)
end
