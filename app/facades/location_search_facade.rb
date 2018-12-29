class LocationSearchFacade

  def initialize(coords)
    @coords = coords
    @types = ["restaurant", "store", "bowling_alley", "bar"]
  end

  def locations
    location_data = GoogleService.new(@coords).location_search

    location_data.map do |location|
      types = find_types(location[:types])
      if types.count > 0
        Location.new({name: location[:name],
                      types: types
                      })
      end
    end.compact
  end

  private

  def find_types(all_types)
    all_types.inject([]) do |types, type|
      types << type if @types.include?(type)
      types
    end
  end

end
