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