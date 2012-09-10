require 'spec_helper'

describe Nominatim do
  describe '.search' do
    it 'returns a Nominatim::Search' do
      Nominatim.search.should be_a Nominatim::Search
    end

    it 'adds a query criterion if given as a parameter' do
      search = Nominatim.search('San Francisco')
      search.criteria[:q].should eq 'San Francisco'
    end
  end

  describe '.reverse' do
    it 'returns a Nominatim::Reverse' do
      Nominatim.reverse.should be_a Nominatim::Reverse
    end

    it 'adds a reverse query criteria if given as a parameters' do
      reverse = Nominatim.reverse('37.733976', '-122.3912081')
      reverse.criteria[:lat].should eq '37.733976'
      reverse.criteria[:lon].should eq '-122.3912081'
    end
  end

  describe '.configure' do

    before do
      Nominatim.config.reset!
    end

    it 'has a default endpoint' do
      Nominatim.config.endpoint.should eq "http://nominatim.openstreetmap.org"
    end

    it 'sets the endpoint' do
      Nominatim.configure do |config|
        config.endpoint = "http://nominatim.org/"
      end
      Nominatim.config.endpoint.should eq "http://nominatim.org/"
    end

    it 'has a default user agent' do
      Nominatim.config.user_agent.should eq "Nominatim Ruby Gem #{Nominatim::VERSION}"
    end

    it 'sets the user agent' do
      Nominatim.configure do |config|
        config.user_agent = "MyApp"
      end
      Nominatim.config.user_agent.should eq "MyApp"
    end

    it 'has a default email' do
      Nominatim.config.email.should be_nil
    end

    it 'sets the email' do
      Nominatim.configure do |config|
        config.email = "foo@bar.com"
      end
      Nominatim.config.email.should eq "foo@bar.com"
    end
  end
end
