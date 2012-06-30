require 'spec_helper'

describe Nominatim::Address do

  describe '#attraction' do
    it 'returns a attraction when set with attraction' do
      address = Nominatim::Address.new(attraction: 'Eiffel Tower')
      address.attraction.should eq 'Eiffel Tower'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      address.attraction.should be_nil
    end
  end

  describe '#clothes' do
    it 'returns clothes when set with clothes' do
      address = Nominatim::Address.new(clothes: 'XXI')
      address.clothes.should eq 'XXI'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      address.clothes.should be_nil
    end
  end

  describe '#house_number' do
    it 'returns a house number when set with house_number' do
      address = Nominatim::Address.new(house_number: 1)
      address.house_number.should eq 1
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      address.house_number.should be_nil
    end
  end

  describe '#road' do
    it 'returns a road when set with road' do
      address = Nominatim::Address.new(road: 'Infinite Loop')
      address.road.should eq 'Infinite Loop'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      address.road.should be_nil
    end
  end

  describe '#commercial' do
    it 'returns a commercial when set with commercial' do
      address = Nominatim::Address.new(commercial: 'Apple, Inc.')
      address.commercial.should eq 'Apple, Inc.'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      address.commercial.should be_nil
    end
  end

  describe '#pedestrian' do
    it 'returns a pedestrian when set with pedestrian' do
      address = Nominatim::Address.new(pedestrian: 'Avenue Pierre Loti')
      address.pedestrian.should eq 'Avenue Pierre Loti'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      address.pedestrian.should be_nil
    end
  end

  describe '#suburb' do
    it 'returns a suburb when set with suburb' do
      address = Nominatim::Address.new(suburb: 'Quartier du Gros Caillou')
      address.suburb.should eq 'Quartier du Gros Caillou'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      address.suburb.should be_nil
    end
  end

  describe '#city_district' do
    it 'returns a city district when set with city_district' do
      address = Nominatim::Address.new(city_district: '7th Arrondissement')
      address.city_district.should eq '7th Arrondissement'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      address.city_district.should be_nil
    end
  end

  describe '#city' do
    it 'returns a city when set with city' do
      address = Nominatim::Address.new(city: 'Santa Clara')
      address.city.should eq 'Santa Clara'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      address.city.should be_nil
    end
  end

  describe '#administrative' do
    it 'returns a administrative when set with administrative' do
      address = Nominatim::Address.new(administrative: 'Paris')
      address.administrative.should eq 'Paris'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      address.administrative.should be_nil
    end
  end

  describe '#county' do
    it 'returns a county when set with county' do
      address = Nominatim::Address.new(county: 'Santa Clara County')
      address.county.should eq 'Santa Clara County'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      address.county.should be_nil
    end
  end

  describe '#state_district' do
    it 'returns a state disctrict when set with state_district' do
      address = Nominatim::Address.new(state_district: 'West Midlands')
      address.state_district.should eq 'West Midlands'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      address.state_district.should be_nil
    end
  end

  describe '#state' do
    it 'returns a state when set with state' do
      address = Nominatim::Address.new(state: 'California')
      address.state.should eq 'California'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      address.state.should be_nil
    end
  end

  describe '#postcode' do
    it 'returns a postcode when set with postcode' do
      address = Nominatim::Address.new(postcode: '95014')
      address.postcode.should eq '95014'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      address.postcode.should be_nil
    end
  end

  describe '#country' do
    it 'returns a country when set with country' do
      address = Nominatim::Address.new(country: 'United States of America')
      address.country.should eq 'United States of America'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      address.country.should be_nil
    end
  end

  describe '#country_code' do
    it 'returns a country code when set with country_code' do
      address = Nominatim::Address.new(country_code: 'us')
      address.country_code.should eq 'us'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      address.country_code.should be_nil
    end
  end

  describe '#place' do
    it 'returns a place when set with place' do
      address = Nominatim::Address.new(place: 'Europe')
      address.place.should eq 'Europe'
    end

    it 'returns nil when not set' do
      address = Nominatim::Address.new
      address.place.should be_nil
    end
  end

end
