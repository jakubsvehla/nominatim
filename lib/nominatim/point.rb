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

    # @return [Array]
    def to_a
      [lat, lon]
    end

    # Return a string representation of the point
    #
    # @return [String]
    def to_s
      to_a.to_s
    end

    # @return [true, false]
    def ==(other)
      self.to_a == other.to_a
    end
  end
end