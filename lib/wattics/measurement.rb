require 'date'

module ComWattics
  class Measurement
    include Comparable

    attr_accessor :id
    attr_reader :timestamp

    def initialize
      set_timestamp
    end

    def set_id(id)
      @id = id
    end

    def set_timestamp
      @timestamp = DateTime.parse(DateTime.now.to_s).iso8601(3)
    end


    def compare_to(other)
      @timestamp <=> other.timestamp
    end

  end
end
