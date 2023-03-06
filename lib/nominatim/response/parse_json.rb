require 'faraday'
require 'multi_json'

module Nominatim
  module Response
    class ParseJson < Faraday::Middleware
      def on_complete(env)
        if env[:body].empty?
          env[:body] = nil
        else
          env[:body] = MultiJson.load(env[:body], symbolize_keys: true)
        end
      end
    end
  end
end