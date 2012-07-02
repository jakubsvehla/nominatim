require 'spec_helper'

describe Nominatim::Point do
  let(:point) { Nominatim::Point.new(52.5487969264788, -1.81642935385411) }

  describe '#lat' do
    it 'returns the latitude' do
      point.lat.should eq 52.5487969264788
    end
  end

  describe '#latitude' do
    it 'returns the latitude' do
      point.latitude.should eq 52.5487969264788
    end
  end

  describe '#lon' do
    it 'returns the longitude' do
      point.lon.should eq -1.81642935385411
    end
  end

  describe '#longitude' do
    it 'returns the longitude' do
      point.longitude.should eq -1.81642935385411
    end
  end

  describe '#to_a' do
    it 'returns an array representing the point' do
      point.to_a.should eq [52.5487969264788, -1.81642935385411]
    end
  end

  describe '#to_s' do
    it 'returns a string representing the point' do
      point.to_s.should eq '[52.5487969264788, -1.81642935385411]'
    end
  end

  describe '#==' do
    it 'returns true when objects coordinates are the same' do
      other = Nominatim::Point.new(52.5487969264788, -1.81642935385411)
      (point == other).should be_true
    end

    it 'returns false when objects coordinates are different' do
      other = Nominatim::Point.new(-1.81642935385411, 52.5487969264788)
      (point == other).should be_false
    end
  end
end