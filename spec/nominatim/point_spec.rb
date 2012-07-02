require 'spec_helper'

describe Nominatim::Point do
  let(:point) { Nominatim::Point.new(52.5487969264788, -1.81642935385411) }

  describe '#lat' do
    it 'returns a latitude' do
      point.lat.should eq 52.5487969264788
    end
  end

  describe '#latitude' do
    it 'returns a latitude' do
      point.latitude.should eq 52.5487969264788
    end
  end

  describe '#lon' do
    it 'returns a longitude' do
      point.lon.should eq -1.81642935385411
    end
  end

  describe '#longitude' do
    it 'returns a longitude' do
      point.longitude.should eq -1.81642935385411
    end
  end
end