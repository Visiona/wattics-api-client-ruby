module ComWatticsInternal
  class MeasurementWithConfig
    include Comparable
    include Config
    include Measurement

    attr_accessor :config, :measurement

    def compare_to(other)
      @measurement.compare_to(other.measurement)
    end

    def set_config(config)
      @config = config
    end

  end
end

# package com.wattics.internal;
#
# import com.wattics.Config;
# import com.wattics.Measurement;

#
# public class MeasurementWithConfig implements Comparable {
#     private Measurement measurement;
#     private Config config;
#
#     public MeasurementWithConfig(Measurement measurement, Config config) {
#         this.measurement = measurement;
#         this.config = config;
#     }
#
#     public Measurement getMeasurement() {
#         return measurement;
#     }
#
#     public void setMeasurement(Measurement measurement) {
#         this.measurement = measurement;
#     }
#
#     public Config getConfig() {
#         return config;
#     }
#
#     public void setConfig(Config config) {
#         this.config = config;
#     }
#
#     @Override
#     public int compareTo(Object o) {
#         MeasurementWithConfig that = (MeasurementWithConfig) o;
#         return this.measurement.compareTo(that.measurement);
#     }
# }
