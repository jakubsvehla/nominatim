require 'spec_helper'

describe Nominatim::Place do
  describe '#display_name' do
    it 'returns a full name when set with display_name' do
      place = Nominatim::Place.new(display_name: 'Los Angeles, California, United States of America')
      place.display_name.should eq 'Los Angeles, California, United States of America'
    end

    it 'returns nil when not set' do
      place = Nominatim::Place.new
      place.display_name.should be_nil
    end
  end

  describe '#class' do
    it 'returns a class when set with class' do
      place = Nominatim::Place.new(class: 'place')
      place.class.should eq 'place'
    end

    it 'returns nil when not set' do
      place = Nominatim::Place.new
      place.class.should be_nil
    end
  end

  describe '#type' do
    it 'returns a type when set with type' do
      place = Nominatim::Place.new(type: 'county')
      place.type.should eq 'county'
    end

    it 'returns nil when not set' do
      place = Nominatim::Place.new
      place.type.should be_nil
    end
  end

  describe '#address' do
    it 'returns a Nominatim::Address when set' do
      place = Nominatim::Place.new(address: {county: 'Los Angeles', state: 'California', country: 'United States of America'})
      place.address.should be_a Nominatim::Address
    end

    it 'returns nil when not set' do
      place = Nominatim::Place.new
      place.address.should be_nil
    end
  end

  describe '#lat' do
    it 'returns a latitude when set with lat' do
      place = Nominatim::Place.new(lat: '52.5487969264788', lon: '-1.81642935385411')
      place.lat.should eq 52.5487969264788
    end

    it 'returns nil when not set' do
      place = Nominatim::Place.new
      place.lat.should be_nil
    end
  end

  describe '#latitude' do
    it 'returns a latitude when set with lat' do
      place = Nominatim::Place.new(lat: '52.5487969264788', lon: '-1.81642935385411')
      place.latitude.should eq 52.5487969264788
    end

    it 'returns nil when not set' do
      place = Nominatim::Place.new
      place.latitude.should be_nil
    end
  end

  describe '#lon' do
    it 'returns a longitude when set with lon' do
      place = Nominatim::Place.new(lat: '52.5487969264788', lon: '-1.81642935385411')
      place.lon.should eq -1.81642935385411
    end

    it 'returns nil when not set' do
      place = Nominatim::Place.new
      place.lon.should be_nil
    end
  end

  describe '#longitude' do
    it 'returns a longitude when set with lon' do
      place = Nominatim::Place.new(lat: '52.5487969264788', lon: '-1.81642935385411')
      place.longitude.should eq -1.81642935385411
    end

    it 'returns nil when not set' do
      place = Nominatim::Place.new
      place.longitude.should be_nil
    end
  end

  describe '#boundingbox' do
    it 'returns a boundingbox when set with boundingbox' do
      place = Nominatim::Place.new(boundingbox: ["52.5487442016602", "52.5488510131836", "-1.81651306152344", "-1.81634628772736"])
      place.boundingbox.should eq ["52.5487442016602", "52.5488510131836", "-1.81651306152344", "-1.81634628772736"]
    end

    it 'returns nil when not set' do
      place = Nominatim::Place.new
      place.boundingbox.should be_nil
    end
  end

  describe '#bounding_box' do
    it 'returns a bounding box when set with boundingbox' do
      place = Nominatim::Place.new(boundingbox: ["52.5487442016602", "52.5488510131836", "-1.81651306152344", "-1.81634628772736"])
      place.bounding_box.should eq ["52.5487442016602", "52.5488510131836", "-1.81651306152344", "-1.81634628772736"]
    end

    it 'returns nil when not set' do
      place = Nominatim::Place.new
      place.bounding_box.should be_nil
    end
  end

  describe '#polygonpoints' do
    it 'returns polygon points when set with polygonpoints' do
      place = Nominatim::Place.new(polygonpoints: [["-1.816513", "52.5487566"], ["-1.8164913", "52.548824"], ["-1.8164685", "52.5488213"]])
      place.polygonpoints.should be_a Nominatim::Polygon
    end

    it 'returns nil when not set' do
      place = Nominatim::Place.new
      place.polygonpoints.should be_nil
    end
  end

  describe '#place_id' do
    it 'returns a place id when set with place_id' do
      place = Nominatim::Place.new(place_id: '84327444')
      place.place_id.should eq 84327444
    end

    it 'returns nil when not set' do
      place = Nominatim::Place.new
      place.place_id.should be_nil
    end
  end

  describe '#osm_id' do
    it 'returns a osm id when set with osm_id' do
      place = Nominatim::Place.new(osm_id: '90394480')
      place.osm_id.should eq 90394480
    end

    it 'returns nil when not set' do
      place = Nominatim::Place.new
      place.osm_id.should be_nil
    end
  end

  describe '#osm_type' do
    it 'returns a osm type when set with osm_type' do
      place = Nominatim::Place.new(osm_type: 'way')
      place.osm_type.should eq 'way'
    end

    it 'returns nil when not set' do
      place = Nominatim::Place.new
      place.osm_type.should be_nil
    end
  end

end
