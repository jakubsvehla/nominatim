module Nominatim
  class Place
    # attr_reader :attrs
    # alias to_hash attrs

    def initialize(attrs = {})
      @attrs = attrs
    end

    # Return display name
    #
    # @return [String]
    def display_name
      @display_name ||= @attrs[:display_name]
    end

    # Return a class
    #
    # @return [String]
    def class
      @class ||= @attrs[:class]
    end

    # Return a type
    #
    # @return [String]
    def type
      @type ||= @attrs[:type]
    end

    # Return an address
    #
    # @return [Nominatim::Address]
    def address
      @address ||= Nominatim::Address.new(@attrs[:address]) unless @attrs[:address].nil?
    end

    # Return a latitude
    #
    # @return [Float]
    def lat
      point.lat
    end
    alias latitude lat

    # Return a longitude
    #
    # @return [Float]
    def lon
      point.lon
    end
    alias longitude lon

    def boundingbox
      @boundingbox ||= @attrs[:boundingbox]
    end
    alias bounding_box boundingbox

    def polygonpoints
      @polygonpoints ||= @attrs[:polygonpoints]
    end

    # Return a place id
    #
    # @return [Integer]
    def place_id
      @place_id ||= @attrs[:place_id].to_i if @attrs[:place_id]
    end

    # Return an OSM id
    #
    # @return [Integer]
    def osm_id
      @osm_id ||= @attrs[:osm_id].to_i if @attrs[:osm_id]
    end

    # Return an OSM type
    #
    # @return [String]
    def osm_type
      @osm_type ||= @attrs[:osm_type]
    end

    private

    def point
      @point ||= Nominatim::Point.new(@attrs[:lat], @attrs[:lon])
    end
  end
end