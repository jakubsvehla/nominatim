require 'spec_helper'

describe Nominatim::Search do

  let(:search) { Nominatim::Search.new }

  it 'has no criteria set' do
    search.criteria.should be_empty
  end

  it 'allows chaining of criterions' do
    search.query('Los Angeles').limit(1)
    search.criteria[:q].should eq 'Los Angeles'
    search.criteria[:limit].should eq 1
  end

  describe '#each' do

    let(:search) { Nominatim::Search.new.query('Los Angeles').limit(1) }

    let(:structured_search){ Nominatim::Search.new.query('Text').city('Los Angeles').country('us').limit(1) }

    before do
      stub_get('/search').
        with(query: { q: 'Los Angeles', limit: 1 }).
        to_return(body: fixture('search.json'))
      stub_get('/search').
        with(query: { city: 'Los Angeles', country: 'us', limit: 1 }).
        to_return(body: fixture('search.json'))
    end

    it 'iterates over the matching places' do
      search.each do |place|
        place.should be_a Nominatim::Place
      end
    end

    it 'returns all matching places' do
      search.count.should eq 1
    end

    it 'returns correct places' do
      search.first.display_name.should eq 'Los Angeles, California, United States of America'
      search.first.lat.should eq 34.0966764
      search.first.lon.should eq -117.7196785
    end

    it 'omits q parameter from structured search' do
      structured_search.first.display_name.should eq 'Los Angeles, California, United States of America'
      structured_search.first.lat.should eq 34.0966764
      structured_search.first.lon.should eq -117.7196785
    end
  end

  describe '#query' do
    it 'adds a query criterion' do
      search.query('Los Angeles')
      search.criteria[:q].should eq 'Los Angeles'
    end
  end

  describe '#country_codes' do
    it 'adds a country codes criterion' do
      search.country_codes('us')
      search.criteria[:countrycodes].should eq 'us'
    end

    it 'adds all country codes when set with an array' do
      search.country_codes(['us', 'ca'])
      search.criteria[:countrycodes].should eq 'us,ca'
    end
  end

  describe '#viewbox' do
    it 'adds a viewbox criterion' do
      search.viewbox(["52.5487442016602", "-1.81651306152344", "52.5488510131836", "-1.81634628772736"])
      search.criteria[:viewbox].should eq "52.5487442016602,-1.81651306152344,52.5488510131836,-1.81634628772736"
    end
  end

  describe '#street' do
    it 'adds a street criterion' do
      search.street('1000', 'street name')
      search.criteria[:street].should eq "1000 street name"
    end
  end
  describe '#city' do
    it 'adds a city criterion' do
      search.city('City name')
      search.criteria[:city].should eq "City name"
    end
  end
  describe '#county' do
    it 'adds a county criterion' do
      search.county('County name')
      search.criteria[:county].should eq "County name"
    end
  end

  describe '#state' do
    it 'adds a state criterion' do
      search.state('State name')
      search.criteria[:state].should eq "State name"
    end
  end

  describe '#country' do
    it 'adds a country criterion' do
      search.country('Country name')
      search.criteria[:country].should eq "Country name"
    end
  end


  describe '#bounded' do
    it 'adds a bounded criterion' do
      search.bounded(true)
      search.criteria[:bounded].should eq 1
    end

    it 'sets 1 when set with true' do
      search.bounded(true)
      search.criteria[:bounded].should eq 1
    end

    it 'sets 0 when set with false' do
      search.bounded(false)
      search.criteria[:bounded].should eq 0
    end
  end

  describe '#polygon' do
    it 'adds a polygon criterion' do
      search.polygon(true)
      search.criteria[:polygon].should eq 1
    end

    it 'sets 1 when set with true' do
      search.polygon(true)
      search.criteria[:polygon].should eq 1
    end

    it 'sets 0 when set with false' do
      search.polygon(false)
      search.criteria[:polygon].should eq 0
    end
  end

  describe '#address_details' do
    it 'adds an address details criterion' do
      search.address_details(true)
      search.criteria[:addressdetails].should eq 1
    end

    it 'sets 1 when set with true' do
      search.address_details(true)
      search.criteria[:addressdetails].should eq 1
    end

    it 'sets 0 when set with false' do
      search.address_details(false)
      search.criteria[:addressdetails].should eq 0
    end
  end

  describe '#extra_tags' do
    it 'adds an extra tags criterion set to 1' do
      search.extra_tags(true)
      search.criteria[:extratags].should eq 1
    end

    it 'sets 0 when set with false' do
      search.extra_tags(false)
      search.criteria[:extratags].should eq 0
    end
  end

  describe '#exclude_place_ids' do
    it 'excludes given place ids' do
      search.exclude_place_ids('1')
      search.criteria[:exclude_place_ids].should eq '1'
    end

    it 'adds all place ids when set with an array' do
      search.exclude_place_ids(['1', '2', '3'])
      search.criteria[:exclude_place_ids].should eq '1,2,3'
    end
  end

  describe '#limit' do
    it 'adds a limit criterion' do
      search.limit(1)
      search.criteria[:limit].should eq 1
    end
  end

end
