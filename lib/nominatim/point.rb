module Nominatim
  class Point
    attr_reader :lat, :lon
    alias latitude lat
    alias longitude lon

    # @param lat [Float]
    # @param lon [Float]
    def initialize(lat, lon)
      @lat, @lon = lat.to_f, lon.to_f if lat && lon
    end
  end
end