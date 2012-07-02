module Nominatim
  class Place
    # attr_reader :attrs
    # alias to_hash attrs

    def initialize(attrs = {})
      @attrs = attrs
    end

    def display_name
      @display_name ||= @attrs[:display_name]
    end

    def class
      @class ||= @attrs[:class]
    end

    def type
      @type ||= @attrs[:type]
    end

    def address
      @address ||= Nominatim::Address.new(@attrs[:address]) unless @attrs[:address].nil?
    end

    def lat
      point.lat
    end
    alias latitude lat

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

    def place_id
      @place_id ||= @attrs[:place_id].to_i if @attrs[:place_id]
    end

    def osm_id
      @osm_id ||= @attrs[:osm_id].to_i if @attrs[:osm_id]
    end

    def osm_type
      @osm_type ||= @attrs[:osm_type]
    end

    private

    def point
      @point ||= Nominatim::Point.new(@attrs[:lat], @attrs[:lon])
    end
  end
end