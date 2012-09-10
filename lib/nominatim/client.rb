require 'faraday'

module Nominatim
  class Client

    # Performs an HTTP GET request
    def get(path, params = {})
      connection.get path, params
    end

    private

    # Returns a Faraday::Connection object
    #
    # @return [Faraday::Connection]
    def connection
      return @connection if defined? @connection

      @connection = Faraday.new Nominatim.config.endpoint do |builder|
        builder.use Nominatim::Response::ParseJson
        builder.adapter Faraday.default_adapter
      end

      @connection.params[:format] = 'json'
      @connection.params[:email] = Nominatim.config.email if Nominatim.config.email

      @connection.headers[:user_agent] = Nominatim.config.user_agent
      @connection.headers[:"accept-language"] = Nominatim.config.accept_language

      @connection
    end
  end
end
