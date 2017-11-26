
module ComWattics
  class ElectricityMeasurement < ComWattics::Measurement

    attr_accessor :active_power_phase_a,
                  :active_power_phase_b,
                  :active_power_phase_c,
                  :reactive_power_phase_a,
                  :reactive_power_phase_b,
                  :reactive_power_phase_c,
                  :apparent_power_phase_a,
                  :apparent_power_phase_b,
                  :apparent_power_phase_c,
                  :voltage_phase_a,
                  :voltage_phase_b,
                  :voltage_phase_c,
                  :current_phase_a,
                  :current_phase_b,
                  :current_phase_c,
                  :active_energy_phase_a,
                  :active_energy_phase_b,
                  :active_energy_phase_c,
                  :line_to_line_voltage_phase_ab,
                  :line_to_line_voltage_phase_bc,
                  :line_to_line_voltage_phase_ac

      def to_string
        return "ElectricityMeasurement{" +
                "id='" + @id + '\'' +
                ", timestamp=" + @timestamp +
                ", activePowerPhaseA=" + active_power_phase_a +
                ", activePowerPhaseB=" + active_power_phase_b +
                ", activePowerPhaseC=" + active_power_phase_c +
                ", reactivePowerPhaseA=" + reactive_power_phase_a +
                ", reactivePowerPhaseB=" + reactive_power_phase_b +
                ", reactivePowerPhaseC=" + reactive_power_phase_c +
                ", apparentPowerPhaseA=" + apparent_power_phase_a +
                ", apparentPowerPhaseB=" + apparent_power_phase_b +
                ", apparentPowerPhaseC=" + apparent_power_phase_c +
                ", voltagePhaseA=" + voltage_phase_a +
                ", voltagePhaseB=" + voltage_phase_b +
                ", voltagePhaseC=" + voltage_phase_c +
                ", currentPhaseA=" + current_phase_a +
                ", currentPhaseB=" + current_phase_b +
                ", currentPhaseC=" + current_phase_c +
                ", activeEnergyPhaseA=" + active_energy_phase_a +
                ", activeEnergyPhaseB=" + active_energy_phase_b +
                ", activeEnergyPhaseC=" + active_energy_phase_c +
                ", lineToLineVoltagePhaseAB=" + line_to_line_voltage_phase_ab +
                ", lineToLineVoltagePhaseBC=" + line_to_line_voltage_phase_bc +
                ", lineToLineVoltagePhaseAC=" + line_to_line_voltage_phase_ac +
                '}'
      end

      def to_hash
        return {
                "id": @id,
                "tsISO8601": @timestamp,
                "aP_1": active_power_phase_a,
                "aP_2": active_power_phase_b,
                "aP_3": active_power_phase_c,
                "rP_1": reactive_power_phase_a,
                "rP_2": reactive_power_phase_b,
                "rP_3": reactive_power_phase_c,
                "apP_1": apparent_power_phase_a,
                "apP_2": apparent_power_phase_b,
                "apP_3": apparent_power_phase_c,
                "v_1": voltage_phase_a,
                "v_2": voltage_phase_b,
                "v_3": voltage_phase_c,
                "c_1": current_phase_a,
                "c_2": current_phase_b,
                "c_3": current_phase_c,
                "pC_1": active_energy_phase_a,
                "pC_2": active_energy_phase_b,
                "pC_3": active_energy_phase_c,
                "v_12": line_to_line_voltage_phase_ab,
                "v_13": line_to_line_voltage_phase_ac,
                "v_23": line_to_line_voltage_phase_bc
              }
      end

  end
end
