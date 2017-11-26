require_relative 'measurement.rb'

module ComWattics
  class SimpleMeasurement < ComWattics::Measurement

    attr_accessor :value


    def to_string
      return "SimpleMeasurement{id='#{id}', timestamp=#{timestamp}, value=#{value}}";
    end

    def to_hash
      return {
              "id": @id,
              "tsISO8601": @timestamp,
              "value": @value
              }
    end

  end
end
