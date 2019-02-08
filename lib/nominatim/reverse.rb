module Nominatim
  class Reverse < Client
    attr_reader :criteria

    def initialize
      @criteria = {}
    end

    # Returns search result or nil if no results received.
    def fetch
      body = get(Nominatim.config.reverse_url, @criteria).body
      return nil if body.empty?
      Nominatim::Place.new(body)
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

    # Include extra tags has hash
    #
    # @param bool [true, false]
    # @return [Nominatim::Reverse]
    def extra_tags(bool)
      @criteria[:extratags] = bool ? 1 : 0
      self
    end
  end
end
