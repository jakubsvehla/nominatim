module Nominatim
  class Polygon
    attr_reader :coordinates

    # @param coordinates [Array<Array<Float, String>>]
    def initialize(coordinates)
      @coordinates = []
      coordinates.each do |c|
        @coordinates.push(Nominatim::Point.new(c[0], c[1]))
      end
    end
  end
end