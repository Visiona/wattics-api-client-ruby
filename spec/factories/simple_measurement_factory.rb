require_relative '../../lib/wattics/simple_measurement.rb'

module ComWattics
  class SimpleMeasurementFactory

    def build
      simple_measurement = SimpleMeasurement.new
      simple_measurement.id = "meter-id-#{ rand(12)}"
      simple_measurement.timestamp ||= generate_date
      simple_measurement.value = random_value
      return simple_measurement
    end

    def generate_date
      DateTime.parse(DateTime.now.to_s).iso8601(3)
    end

    def random_value
      rand(2.34..120.34).round(2)
    end

  end
end


# FactoryBot.define do
#   factory :simple_measurement do
#     sequence(:id){ |n| "meter-id-#{n}"}
#     timestamp {generate_date}
#     value {random_value}
#   end
# end
#
# module FactoryHelpers
#   extend self
#
#   def generate_date
#     DateTime.parse(DateTime.new(2017,rand(11),rand(28),rand(24),rand(59),rand(59)).to_s).iso8601(3)
#   end
#
#   def random_value
#     rand(2.34..120.34).round(2)
#   end
# end
