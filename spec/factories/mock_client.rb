require_relative '../../lib/wattics/internal/client'

module ComWattics
  class MockClient < ComWatticsInternal::Client

    def send(measurement, config)
      Client.new.send_http_response(measurement, config)
    end

  end
end
