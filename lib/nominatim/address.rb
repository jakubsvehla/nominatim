module Nominatim
  class Address
    def initialize(attrs = {})
      @attrs = attrs
    end

    def attraction
      @attraction ||= @attrs[:attraction]
    end

    def clothes
      @clothes ||= @attrs[:clothes]
    end

    def house_number
      @house_number ||= @attrs[:house_number]
    end

    def road
      @road ||= @attrs[:road]
    end

    def commercial
      @commercial ||= @attrs[:commercial]
    end

    def pedestrian
      @pedestrian ||= @attrs[:pedestrian]
    end

    def suburb
      @suburb ||= @attrs[:suburb]
    end

    def city_district
      @city_district ||= @attrs[:city_district]
    end

    def city
      @city ||= @attrs[:city]
    end

    def administrative
      @administrative ||= @attrs[:administrative]
    end

    def county
      @county ||= @attrs[:county]
    end

    def state_district
      @state_district ||= @attrs[:state_district]
    end

    def state
      @state ||= @attrs[:state]
    end

    def postcode
      @postcode ||= @attrs[:postcode]
    end

    def country
      @country ||= @attrs[:country]
    end

    def country_code
      @country_code ||= @attrs[:country_code]
    end

    def place
      @place ||= @attrs[:place]
    end

    def town
      @town ||= @attrs[:town]
    end

    def village
      @village ||= @attrs[:village]
    end
  end
end
