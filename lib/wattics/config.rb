
module ComWattics
  class Config

    PRODUCTION = "https://web-collector.wattics.com/measurements/v2/unifiedjson/"
    DEVELOPMENT = "https://dev-web-collector.wattics.com/measurements/v2/unifiedjson/"
    MYDEV = 'http://localhost:4567'

    def initialize(env, username=ENV[:username], password=ENV[:password])
      @environment = env
      @username = username
      @password = password
      @uri = set_uri(env)
      # @dummy_config = self.new(nil, nil, nil)
    end


    def get_username
      @username
    end

    def get_password
      @password
    end

    def set_uri(env)
      if env == 'production'
        PRODUCTION
      elsif env == 'development'
        DEVELOPMENT
      elsif env == 'mydev'
        MYDEV
      else
        nil
      end
    end

    def get_uri
      @uri
    end

  end
end
