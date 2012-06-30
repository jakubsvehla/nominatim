module Nominatim
  class Configuration

    DEFAULT_ENDPOINT = 'http://nominatim.openstreetmap.org/'

    DEFAULT_USER_AGENT = "Nominatim Ruby Gem #{Nominatim::VERSION}"

    DEFAULT_EMAIL = nil

    VALID_OPTIONS_KEYS = [
      :endpoint,
      :user_agent,
      :email
    ]

    attr_accessor *VALID_OPTIONS_KEYS

    def initialize
      reset!
    end

    def configure
      yield self
      self
    end

    def reset!
      self.endpoint   = DEFAULT_ENDPOINT
      self.user_agent = DEFAULT_USER_AGENT
      self.email      = DEFAULT_EMAIL
    end
  end
end