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

      options = {
        request: {
          timeout: Nominatim.config.timeout
        }
      }

      @connection = Faraday.new Nominatim.config.endpoint, options do |builder|
        builder.use Nominatim::Response::ParseJson
        builder.adapter Faraday.default_adapter
      end

      @connection.params[:format] = 'json'
      @connection.params[:email] = Nominatim.config.email if Nominatim.config.email
      @connection.params[:key] = Nominatim.config.key if Nominatim.config.key

      @connection.headers[:user_agent] = Nominatim.config.user_agent
      @connection.headers[:"accept-language"] = Nominatim.config.accept_language

      @connection
    end
  end
end
