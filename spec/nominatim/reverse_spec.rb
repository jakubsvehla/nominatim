require 'spec_helper'

describe Nominatim::Reverse do

  let(:reverse) { Nominatim::Reverse.new }

  it 'has no criteria set' do
    reverse.criteria.should be_empty
  end

  it 'allows chaining of criterions' do
    reverse.lat('37.733976').lon('-122.3912081').address_details(1)
    reverse.criteria[:lat].should eq '37.733976'
    reverse.criteria[:lon].should eq '-122.3912081'
    reverse.criteria[:addressdetails].should eq 1
  end

  describe '#each' do
    let(:reverse) { Nominatim::Reverse.new.lat('37.733976').lon('-122.3912081').address_details(1) }

    before do
      stub_get('/reverse').
        with(query: { lat: '37.733976', lon: '-122.3912081', addressdetails: 1 }).
        to_return(body: fixture('reverse.json'))
    end

    it 'iterates over the matching places' do
			reverse.fetch.should be_a Nominatim::Place
    end

    it 'returns correct places' do
      reverse.fetch.display_name.should eq '4900, 3rd Street, San Francisco, California, 94124, United States of America'
      reverse.fetch.address.city.should eq 'San Francisco'
      reverse.fetch.address.state.should eq 'California'
    end
  end

  describe '#lat' do
    it 'adds a latitude criterion' do
      reverse.lat('37.733976')
      reverse.criteria[:lat].should eq '37.733976'
    end
  end

  describe '#lon' do
    it 'adds a longitude criterion' do
      reverse.lon('-122.3912081')
      reverse.criteria[:lon].should eq '-122.3912081'
    end
  end

  describe '#address_details' do
    it 'adds an address details criterion' do
      reverse.address_details(true)
      reverse.criteria[:addressdetails].should eq 1
    end

    it 'sets 1 when set with true' do
      reverse.address_details(true)
      reverse.criteria[:addressdetails].should eq 1
    end

    it 'sets 0 when set with false' do
      reverse.address_details(false)
      reverse.criteria[:addressdetails].should eq 0
    end
  end
end
