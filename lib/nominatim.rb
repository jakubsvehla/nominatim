require "nominatim/version"
require "nominatim/configuration"
require "nominatim/point"
require "nominatim/polygon"
require "nominatim/address"
require "nominatim/place"
require "nominatim/response/parse_json"
require "nominatim/client"
require "nominatim/search"

module Nominatim

  # @return [Nominatim::Search]
  def self.search(q = nil)
    search = Nominatim::Search.new
    search.query(q) if q
    search
  end

  # @return [Nominatim::Configuration]
  def self.config
    @config ||= Configuration.new
  end

  def self.configure(&block)
    config.configure &block
  end
end
