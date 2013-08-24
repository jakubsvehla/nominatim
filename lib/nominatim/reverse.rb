module Nominatim
  class Reverse < Client
    attr_reader :criteria

    def initialize
      @criteria = {}
    end

    # Returns search result.
    def fetch
      Nominatim::Place.new(get('reverse', @criteria).body)
    end

    # Latitude string to search for.
    #
    # @param lat [String] Latitude
    # @return [Nominatim::Reverse]
    def lat(lat)
      @criteria[:lat] = lat
      self
    end

    # Longitude string to search for.
    #
    # @param lon [String] Longitude
    # @return [Nominatim::Reverse]
    def lon(lon)
      @criteria[:lon] = lon
      self
    end

    # Include a breakdown of the address into elements.
    #
    # @param bool [true, false]
    # @return [Nominatim::Reverse]
    def address_details(bool)
      @criteria[:addressdetails] = bool ? 1 : 0
      self
    end

  end
end
