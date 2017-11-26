require_relative '../../lib/wattics/electricity_measurement.rb'
require_relative '../../lib/wattics/measurement.rb'


module ComWattics
  class ElectricityMeasurementFactory

    def build
      object = ElectricityMeasurement.new
      object.id = "meter-id-#{rand(600)}"
      object.timestamp ||= generate_date
      object.active_power_phase_a = random_value
      object.active_power_phase_b = random_value
      object.active_power_phase_c = random_value
      object.reactive_power_phase_a = random_value
      object.reactive_power_phase_b = random_value
      object.reactive_power_phase_c = random_value
      object.apparent_power_phase_a = random_value
      object.apparent_power_phase_b = random_value
      object.apparent_power_phase_c = random_value
      object.voltage_phase_a = random_value
      object.voltage_phase_b = random_value
      object.voltage_phase_c = random_value
      object.current_phase_a = random_value
      object.current_phase_b = random_value
      object.current_phase_c = random_value
      object.active_energy_phase_a = random_value
      object.active_energy_phase_b = random_value
      object.active_energy_phase_c = random_value
      object.line_to_line_voltage_phase_ab = random_value
      object.line_to_line_voltage_phase_bc = random_value
      object.line_to_line_voltage_phase_ac = random_value
      return object
    end

    def generate_date
      DateTime.parse(DateTime.now.to_s).iso8601(3)
    end

    def random_value
      rand(2.34..120.34).round(2)
    end

  end
end
