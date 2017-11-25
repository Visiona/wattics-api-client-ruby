require_relative 'agent.rb'
require_relative 'config.rb'
require_relative 'simple_measurement.rb'
require_relative 'electricity_measurement'

class Main
  include ComWattics

  def main()
    agent = Agent.new
    # agent.add_measurement_sent_handler(measurement, http_response)
    #  uses method measurementSentHandler; it seems to be printing measurement and response to the log, deals with async sending

    # config = Config.new('production', "username", "password")
    config = Config.new('mydev', "username", "password")

    simple_measurement = SimpleMeasurement.new
    # simple_measurement.id = "meter-id-01"
    simple_measurement.set_id("meter-id-01")
    simple_measurement.set_timestamp
    simple_measurement.value = 12.5
    agent.send(simple_measurement, config)


    electricity_measurement = ElectricityMeasurement.new
    # electricity_measurement.id = "meter-id-02"
    electricity_measurement.set_id("meter-id-02")
    electricity_measurement.set_timestamp
    electricity_measurement.active_power_phase_a = 5.12
    electricity_measurement.active_power_phase_b = 1.5
    # rest of data etc....
    agent.send(electricity_measurement, config)
  end

end

Main.new.main

# import com.wattics.*;
#
# import static com.wattics.Config.Environment.DEVELOPMENT;
# import static java.time.LocalDateTime.now;
#
# public class Main {
#     public static void main(String[] args) {
#         Agent agent = Agent.getInstance();
  #         agent.addMeasurementSentHandler((measurement, httpResponse) -> {
#             System.out.println(measurement);
#             System.out.println(httpResponse);
#         });
#
#         // Config config = new Config(PRODUCTION, "username", "password");
#         Config config = new Config(DEVELOPMENT, "username", "password");
#
#         SimpleMeasurement simpleMeasurement = new SimpleMeasurement();
#         simpleMeasurement.setId("meter-id-01");
#         simpleMeasurement.setTimestamp(now());
#         simpleMeasurement.setValue(12.5);
#         agent.send(simpleMeasurement, config);
#
#         ElectricityMeasurement electricityMeasurement = new ElectricityMeasurement();
#         electricityMeasurement.setId("meter-id-02");
#         electricityMeasurement.setTimestamp(now());
#         electricityMeasurement.setActivePowerPhaseA(5.12);
#         electricityMeasurement.setActiveEnergyPhaseA(1.5);
#         // ...
#         agent.send(electricityMeasurement, config);
#     }
# }
