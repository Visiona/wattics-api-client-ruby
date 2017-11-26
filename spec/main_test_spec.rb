require 'spec_helper'
require_relative '../lib/wattics/config.rb'



describe ComWatticsInternal::Client do

  let(:simple_measure){ComWattics::SimpleMeasurementFactory.new}
  let(:electricity_measure){ComWattics::ElectricityMeasurementFactory.new}

  before(:all) do
    client = ComWattics::MockClient.new
  end


  it 'test if measurements were sent' do
    # count_down_latch = CountDownLatch.new(24)
    dummy_config = ComWattics::Config.new('mydev', nil, nil)
    agent = ComWattics::Agent.new

    # agent.addMeasurementSentHandler((measurement, client.build_connection(count_down_latch.count_down))

    measurement_list = []
    12.times do
      measurement_list.push(electricity_measure.build)
      measurement_list.push(simple_measure.build)
    end

    # response = agent.send(measurement_list[0], dummy_config)
    response = 0
    measurement_list.each do |m|
      response = agent.send(m, dummy_config)
      return if response != 200
    end

    # count_down_latch.await
    expect(response).to be_equal(200)
  end

  it 'test if measurements are sorted before being sent' do
    # agent = ComWattics::Agent.new
    # dummy_config = ComWattics::Config.new(nil, nil, nil)
    # # count_down_latch = CountDownLatch.new(12)
    #
    # # List<Measurement> sentMeasurements = new CopyOnWriteArrayList<>();
    # #
    # # ClientFactory.setInstance(new ClientFactory() {
    # #     @Override
    # #     public Client createClient() {
    # #         return new MockClient() {
    # #             @Override
    # #             public CloseableHttpResponse send(Measurement measurement, Config config) throws IOException {
    # #                 sentMeasurements.add(measurement);
    # #                 countDownLatch.countDown();
    # #                 return super.send(measurement, config);
    # #             }
    # #         };
    # #     }
    # # });
    # #
    # electricity_measure.id = 'channelId'
    #
    # measurement_list = []
    # 12.times do
    #   simple_measure.timestamp = DateTime.parse(DateTime.new(2017,rand(11),rand(28),rand(24),rand(59),rand(59)).to_s).iso8601(3)
    #   measurement_list.push(simple_measure.build)
    # end
    #
    #
    # agent.send(measurement_list, dummy_config)
    # sent_measurements = measurement_list
    # # count_down_latch.await
    #
    # measurement_list.sort! { |a, b|  a.compare_to(b) }
    # # List<Measurement> sortedMeasurements = measurementList
    # #         .stream()
    # #         .sorted(comparing(measurement -> measurement.timestamp))
    # #         .collect(toList());
    #
    #
    # expect(sorted_measurements == sent_measurements).to be_truthy
  end

  it 'check if processor is idle only after sending' do
    # number_of_measurements_to_send = 1000
    # #
    # # CountDownLatch countDownLatch = new CountDownLatch(numberOfMeasurementsToSend);
    # # ClientFactory.setInstance(new ClientFactory() {
    # #     @Override
    # #     public Client createClient() {
    # #         return new MockClient() {
    # #             @Override
    # #             public CloseableHttpResponse send(Measurement measurement, Config config) throws IOException {
    # #                 if (measurement.getId().equals("0")) {
    # #                     try {
    # #                         Thread.sleep(10);
    # #                     } catch (InterruptedException e) {
    # #                     }
    # #                 }
    # #                 countDownLatch.countDown();
    # #                 return super.send(measurement, config);
    # #             }
    # #         };
    # #     }
    # # });
    # #
    # # Agent agent = Agent.getInstance(2);
    # # SimpleMeasurementFactory measurementFactory = SimpleMeasurementFactory.getInstance();
    # # for (int i = 0; i < numberOfMeasurementsToSend; i++) {
    # #     measurementFactory.setId(Integer.toString(i % 3));
    # #     agent.send(measurementFactory.build(), DUMMY_CONFIG);
    # # }
    #
    # count_down_latch.await
  end

end


# package com.wattics;
#
# import com.wattics.internal.Client;
# import org.apache.http.client.methods.CloseableHttpResponse;
# import org.junit.After;
# import org.junit.Assert;
# import org.junit.Before;
# import org.junit.Test;
#
# import java.io.IOException;
# import java.util.ArrayList;
# import java.util.List;
# import java.util.concurrent.CopyOnWriteArrayList;
# import java.util.concurrent.CountDownLatch;
#
# import static com.wattics.Config.DUMMY_CONFIG;
# import static java.time.LocalDateTime.now;
# import static java.util.Comparator.comparing;
# import static java.util.stream.Collectors.toList;


# public class MainTest {
#     @Before
#     public void setUp() throws Exception {
#         ClientFactory.setInstance(new ClientFactory() {
#             @Override
#             public Client createClient() {
#                 return new MockClient();
#             }
#         });
#     }
#
#     @After
#     public void tearDown() throws Exception {
#         ClientFactory.setInstance(null);
#         Agent.dispose();
#     }





#     @Test
#     public void testAllMeasurementsAreSent() throws InterruptedException {
#         CountDownLatch countDownLatch = new CountDownLatch(24);
#
#         Agent agent = Agent.getInstance();
#         agent.addMeasurementSentHandler((measurement, closeableHttpResponse) -> {
#             countDownLatch.countDown();
#         });
#
#         ElectricityMeasurementFactory electricityMeasurementFactory = ElectricityMeasurementFactory.getInstance();
#         SimpleMeasurementFactory simpleMeasurementFactory = SimpleMeasurementFactory.getInstance();
#
#         List<Measurement> measurementList = new ArrayList<>();
#         for (int i = 0; i < 12; i++) {
#             measurementList.add(electricityMeasurementFactory.build());
#             measurementList.add(simpleMeasurementFactory.build());
#         }
#
#         agent.send(measurementList, DUMMY_CONFIG);
#
#         countDownLatch.await();
#     }





#     @Test
#     public void testThatMeasurementsAreSortedBeforeBeingSent() throws InterruptedException {
#         CountDownLatch countDownLatch = new CountDownLatch(12);
#         List<Measurement> sentMeasurements = new CopyOnWriteArrayList<>();
#
#         ClientFactory.setInstance(new ClientFactory() {
#             @Override
#             public Client createClient() {
#                 return new MockClient() {
#                     @Override
#                     public CloseableHttpResponse send(Measurement measurement, Config config) throws IOException {
#                         sentMeasurements.add(measurement);
#                         countDownLatch.countDown();
#                         return super.send(measurement, config);
#                     }
#                 };
#             }
#         });
#
#         Agent agent = Agent.getInstance();
#         SimpleMeasurementFactory simpleMeasurementFactory = SimpleMeasurementFactory.getInstance();
#         simpleMeasurementFactory.setId("channelId");
#
#         List<Measurement> measurementList = new ArrayList<>();
#         for (int i = 0; i < 12; i++) {
#             simpleMeasurementFactory.setTimestamp(now().minusHours(i));
#             measurementList.add(simpleMeasurementFactory.build());
#         }
#
#         agent.send(measurementList, DUMMY_CONFIG);
#         countDownLatch.await();
#
#         List<Measurement> sortedMeasurements = measurementList
#                 .stream()
#                 .sorted(comparing(measurement -> measurement.timestamp))
#                 .collect(toList());
#
#         Assert.assertEquals(sortedMeasurements, sentMeasurements);
#     }
#
#     @Test
#     public void testProcessorIsNotIdleUntilAfterItSendsTheLastMeasurement() throws Exception {
#         int numberOfMeasurementsToSend = 1000;
#
#         CountDownLatch countDownLatch = new CountDownLatch(numberOfMeasurementsToSend);
#         ClientFactory.setInstance(new ClientFactory() {
#             @Override
#             public Client createClient() {
#                 return new MockClient() {
#                     @Override
#                     public CloseableHttpResponse send(Measurement measurement, Config config) throws IOException {
#                         if (measurement.getId().equals("0")) {
#                             try {
#                                 Thread.sleep(10);
#                             } catch (InterruptedException e) {
#                             }
#                         }
#                         countDownLatch.countDown();
#                         return super.send(measurement, config);
#                     }
#                 };
#             }
#         });
#
#         Agent agent = Agent.getInstance(2);
#         SimpleMeasurementFactory measurementFactory = SimpleMeasurementFactory.getInstance();
#         for (int i = 0; i < numberOfMeasurementsToSend; i++) {
#             measurementFactory.setId(Integer.toString(i % 3));
#             agent.send(measurementFactory.build(), DUMMY_CONFIG);
#         }
#
#         countDownLatch.await();
#     }
#
#     @Test
#     public void main() throws InterruptedException {
#         Agent agent = Agent.getInstance();
#         agent.send(SimpleMeasurementFactory.getInstance().build(), DUMMY_CONFIG);
#     }
# }
