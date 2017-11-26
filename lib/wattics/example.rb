require_relative 'agent.rb'
require_relative 'config.rb'
require_relative 'simple_measurement.rb'
require_relative 'electricity_measurement'

class Main
  include ComWattics

  def main()
    agent = Agent.new
    # agent.add_measurement_sent_handler(measurement, http_response)

    # config = Config.new('production', "username", "password")
    # config = Config.new('development', "username", "password")
    config = Config.new('mydev', "username", "password")

    simple_measurement = SimpleMeasurement.new
    simple_measurement.set_id("meter-id-01")
    simple_measurement.set_timestamp
    simple_measurement.value = 12.5
    agent.send(simple_measurement, config)


    electricity_measurement = ElectricityMeasurement.new
    electricity_measurement.set_id("meter-id-02")
    electricity_measurement.set_timestamp
    electricity_measurement.active_power_phase_a = 5.12
    electricity_measurement.active_power_phase_b = 1.5
    # rest of data etc....
    agent.send(electricity_measurement, config)
  end

end

Main.new.main
