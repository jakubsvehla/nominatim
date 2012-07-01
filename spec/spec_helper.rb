require 'simplecov'

SimpleCov.start do
  add_filter 'spec'
end

require 'nominatim'
require 'webmock/rspec'

WebMock.disable_net_connect!

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end

def a_get(path)
  a_request(:get, "#{Nominatim.config.endpoint}#{path}").with(query: { format: 'json' })
end

def stub_get(path)
  stub_request(:get, "#{Nominatim.config.endpoint}#{path}").with(query: { format: 'json' })
end
