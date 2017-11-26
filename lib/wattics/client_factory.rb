require_relative './internal/client'

module ComWattics
  class ClientFactory

    def get_instance
      if @singleton_instance == nil
        @singleton_instance = ClientFactory.new
      end
      return @singleton_instance
    end

    def create_client
      return Client.new
    end

  end
end
