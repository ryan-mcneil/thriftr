class Location
  attr_reader :name, :types

  def initialize(attrs)
    @name = attrs[:name]
    @types = attrs[:types]
  end
end
