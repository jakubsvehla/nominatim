require 'spec_helper'

describe Nominatim::Client do
  after do
    WebMock.reset!
  end

  describe '#get' do
    before do
      stub_get('/search').to_return(body: "[]")
    end

    it 'requests the correct resource' do
      Nominatim::Client.new.get('/search')
      a_get('/search').should have_been_requested
    end

    it 'parses the body' do
      response = Nominatim::Client.new.get('/search')
      response.body.should eq []
    end
  end
end