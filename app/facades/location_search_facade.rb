class LocationSearchFacade

  def initialize
    @types = ["restaurant", "store", "movie_theater", "bar"]
  end

  def locations
    conn = Faraday.new(url: "https://maps.googleapis.com")
    results = conn.get "/maps/api/place/nearbysearch/json?location=39.742905,-104.989545&radius=500&key=#{ENV['GOOGLE_API_KEY']}"

    location_data = JSON.parse(results.body, symbolize_names: true)[:results]

    locations = location_data.map do |location|
      types = find_types(location[:types])
      if types.count > 0
        attrs = {
          name: location[:name],
          types: types
        }
        Location.new(attrs)
      end
    end.compact
  end

  private

  def find_types(all_types)
    types = []
    all_types.each do |type|
      types << type if @types.include?(type)
    end
    types
  end
end
