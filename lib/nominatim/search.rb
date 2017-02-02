module Nominatim
  class Search < Client
    include Enumerable
    attr_reader :criteria

    def initialize
      @criteria = {}
    end

    # Iterates over the search results.
    def each(&block)
      @criteria.delete(:q) if (@criteria.keys & [:street, :city, :county, :state, :country, :postalcode]).count > 0
      @results ||= get(Nominatim.config.search_url, @criteria).body.map! { |attrs| Nominatim::Place.new(attrs) }
      @results.each(&block)
    end

    # Structured search requests
    # @see https://wiki.openstreetmap.org/wiki/Nominatim
    %w(city county state country postalcode).to_a.each do |criterion|
      define_method(criterion) do |param|
        @criteria[criterion.to_sym] = param
        self
      end
    end

    # Structured street search request
    #
    # @see https://wiki.openstreetmap.org/wiki/Nominatim
    def street housenumber, streetname
      @criteria[:street] = "#{housenumber} #{streetname}"
      self
    end

    # Query string to search for.
    #
    # @param q [String] Query string
    # @return [Nominatim::Search]
    def query(q)
      @criteria[:q] = q
      self
    end

    # Street string to search for.
    #
    # @param street [String] Street string
    # @return [Nominatim::Search]
    def street(street)
      @criteria[:street] = street
      self
    end

    # City string to search for.
    #
    # @param city [String] city string
    # @return [Nominatim::Search]
    def city(city)
      @criteria[:city] = city
      self
    end

    # County string to search for.
    #
    # @param county [String] county string
    # @return [Nominatim::Search]
    def county(county)
      @criteria[:county] = county
      self
    end

    # State string to search for.
    #
    # @param state [String] state string
    # @return [Nominatim::Search]
    def state(state)
      @criteria[:state] = state
      self
    end

    # Country string to search for.
    #
    # @param country [String] country string
    # @return [Nominatim::Search]
    def country(country)
      @criteria[:country] = country
      self
    end

    # Postal code string to search for.
    #
    # @param postalcode [String] postalcode string
    # @return [Nominatim::Search]
    def postalcode(postalcode)
      @criteria[:postalcode] = postalcode
      self
    end

    # Limit search results to a specific country (or a list of countries).
    #
    # @param codes [Array<String>, String]
    # @see https://wiki.openstreetmap.org/wiki/Nominatim
    # @return [Nominatim::Search]
    def country_codes(codes)
      if codes.instance_of? Array
        @criteria[:countrycodes] = codes.join(',')
      else
        @criteria[:countrycodes] = codes
      end
      self
    end

    # The preferred area to find search results.
    #
    # @param viewbox [Array<String>]
    # @return [Nominatim::Search]
    def viewbox(viewbox)
      @criteria[:viewbox] = viewbox.join(',')
      self
    end

    # Restrict the results to only items contained with the bounding box.
    #
    # @param bool [true, false]
    # @see https://wiki.openstreetmap.org/wiki/Nominatim
    # @return [Nominatim::Search]
    def bounded(bool)
      @criteria[:bounded] = bool ? 1 : 0
      self
    end

    # Output polygon outlines for items found.
    #
    # @param bool [true, false]
    # @return [Nominatim::Search]
    def polygon(bool)
      @criteria[:polygon] = bool ? 1 : 0
      self
    end

    # Include a breakdown of the address into elements.
    #
    # @param bool [true, false]
    # @return [Nominatim::Search]
    def address_details(bool)
      @criteria[:addressdetails] = bool ? 1 : 0
      self
    end

    # Exclude given place ids from the search result.
    #
    # @param ids [Array<String>, String] Place ids
    # @return [Nominatim::Search]
    def exclude_place_ids(ids)
      if ids.instance_of? Array
        @criteria[:exclude_place_ids] = ids.join(',')
      else
        @criteria[:exclude_place_ids] = ids
      end
      self
    end

    # Limit the number of returned results.
    #
    # @param limit [Integer]
    # @return [Nominatim::Search]
    def limit(limit)
      @criteria[:limit] = limit
      self
    end

  end
end
