class SearchFacade

  def initialize

  end

  def search_locations
    conn = Faraday.new(url: "https://maps.googleapis.com")
    results = conn.get "/maps/api/place/nearbysearch/json?location=39.7491066,-104.9969853&radius=200&key=#{ENV['GOOGLE_API_KEY']}"

    location_data = JSON.parse(results.body, symbolize_names: true)[:results]

    locations = location_data.map do |location|
      Location.new(location[:name],
                    find_category(location[:types])
                  )
    end

  end

  private

  def find_category(types)

  end
end
