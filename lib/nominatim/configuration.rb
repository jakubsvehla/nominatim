module Nominatim
  class Configuration

    DEFAULT_ENDPOINT = 'http://nominatim.openstreetmap.org'

    DEFAULT_USER_AGENT = "Nominatim Ruby Gem #{Nominatim::VERSION}"

    DEFAULT_EMAIL = nil

    DEFAULT_LANGUAGE = 'en'

    DEFAULT_TIMEOUT = nil

    DEFAULT_SEARCH_URL = 'search'
    DEFAULT_REVERSE_URL = 'reverse'

    VALID_OPTIONS_KEYS = [
      :endpoint,
      :user_agent,
      :email,
      :accept_language,
      :timeout,
      :search_url,
      :reverse_url
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
      self.endpoint         = DEFAULT_ENDPOINT
      self.user_agent       = DEFAULT_USER_AGENT
      self.email            = DEFAULT_EMAIL
      self.accept_language  = DEFAULT_LANGUAGE
      self.timeout          = DEFAULT_TIMEOUT
      self.search_url       = DEFAULT_SEARCH_URL
      self.reverse_url      = DEFAULT_REVERSE_URL
    end
  end
end
