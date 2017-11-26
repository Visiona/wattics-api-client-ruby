require 'faraday'
require 'json'
require_relative './internal/client.rb'

module ComWattics
  class Agent

    puts Faraday::VERSION
    puts Faraday::default_adapter

    def send(measurement, config)
      # new MeasurementWithConfig(measurement, config);
      #  Here we have processors, collectors, parrallel stream

      ComWatticsInternal::Client.new.send_http_response(measurement, config).status
    end

    def send_collection(measurement_list, config)
      measurement_groups = measurement_list.group_by{ |o| o.id }
      # parallelStream

      measurement_groups.each{ |m| send(m, config) }
      # measurementGroups.forEach((channelId, measurementsForChannelId) -> {
      #     List<MeasurementWithConfig> measurementsWithConfig = measurementsForChannelId
      #             .stream()
      #             .map(measurement -> new MeasurementWithConfig(measurement, config))
      #             .collect(Collectors.toList());
    end


    # def convert_to_hash(object)
    #   object.instance_variables.map do |var|
    #     [var[1..-1].to_sym, object.instance_variable_get(var)]
    #   end.to_h
    # end


    def get_instance(maximumParallelSenders)
        # Agent getInstance()
    end

    def dispose
    end

    def agent_parallel
    # agentThreadGroup = new ThreadGroup("Agent");
    # processorPool = new ProcessorPool(this, maximumParallelSenders, agentThreadGroup);
    # enqueuedMeasurementsWithConfig = synchronizedListMultimap(LinkedListMultimap.create());
    # sentMeasurementsWithContext = new LinkedBlockingQueue<>();
    # measurementSentHandlerList = new CopyOnWriteArrayList<BiConsumer<Measurement, CloseableHttpResponse>>();
    # startProcessorFeeder();
    # startMeasurementSentHandlerDispatcher();
    end

    def start_processor_feeder
    end

    def startMeasurementSentHandlerDispatcher
    end

    def send_stream
    end

    def sleep
    end

    def addMeasurementSentHandler
    end

    def reportSentMeasurement
    end

  end
end





# package com.wattics;
#
# import com.google.common.collect.LinkedListMultimap;
# import com.google.common.collect.ListMultimap;
# import com.wattics.internal.MeasurementWithConfig;
# import com.wattics.internal.Processor;
# import com.wattics.internal.ProcessorPool;
# import org.apache.http.client.methods.CloseableHttpResponse;
#
# import java.util.*;
# import java.util.concurrent.BlockingQueue;
# (BlockingQueue methods come in four forms, with different ways of handling operations that cannot be satisfied immediately, but may be satisfied at some point in the future: one throws an exception, the second returns a special value (either null or false, depending on the operation), the third blocks the current thread indefinitely until the operation can succeed, and the fourth blocks for only a given maximum time limit before giving up.)
# # import java.util.concurrent.CopyOnWriteArrayList;
# (A thread-safe variant of ArrayList in which all mutative operations (add, set, and so on) are implemented by making a fresh copy of the underlying array.)
# # import java.util.concurrent.LinkedBlockingQueue;
# (An optionally-bounded blocking queue based on linked nodes. This queue orders elements FIFO (first-in-first-out). The head of the queue is that element that has been on the queue the longest time. The tail of the queue is that element that has been on the queue the shortest time. New elements are inserted at the tail of the queue, and the queue retrieval operations obtain elements at the head of the queue. Linked queues typically have higher throughput than array-based queues but less predictable performance in most concurrent applications.)
# # import java.util.function.BiConsumer;
# (Returns a composed BiConsumer that performs, in sequence, this operation followed by the after operation. If performing either operation throws an exception, it is relayed to the caller of the composed operation. If performing this operation throws an exception, the after operation will not be performed.)
# # import java.util.stream.Collectors;
# (Implementations of Collector that implement various useful reduction operations, such as accumulating elements into collections, summarizing elements according to various criteria, etc.)
# #
# import static com.google.common.collect.Lists.newArrayList;
# import static com.google.common.collect.Multimaps.synchronizedListMultimap;

# public class Agent {
#     private static Agent SINGLETON_INSTANCE;
#
#     private final ThreadGroup agentThreadGroup;
#     private ProcessorPool processorPool;
#     private final ListMultimap<String, MeasurementWithConfig> enqueuedMeasurementsWithConfig;
#     private final BlockingQueue<Object[]> sentMeasurementsWithContext;
#     private final List<BiConsumer<Measurement, CloseableHttpResponse>> measurementSentHandlerList;
#
#     public static synchronized Agent getInstance() {
#         return getInstance(0);
#     }
#
#     public static synchronized Agent getInstance(int maximumParallelSenders) {
#         if (SINGLETON_INSTANCE == null) {
#             SINGLETON_INSTANCE = new Agent(maximumParallelSenders);
#         }
#
#         return SINGLETON_INSTANCE;
#     }
#
#     public static synchronized void dispose() {     ////INTERRUPTING THREAD GROUP ///
#         if (SINGLETON_INSTANCE != null) {
#             SINGLETON_INSTANCE.agentThreadGroup.interrupt();
#             SINGLETON_INSTANCE = null;
#         }
#     }
#
#     private Agent(int maximumParallelSenders) {
#         agentThreadGroup = new ThreadGroup("Agent");
#         processorPool = new ProcessorPool(this, maximumParallelSenders, agentThreadGroup);
#         enqueuedMeasurementsWithConfig = synchronizedListMultimap(LinkedListMultimap.create());
#         sentMeasurementsWithContext = new LinkedBlockingQueue<>();
#         measurementSentHandlerList = new CopyOnWriteArrayList<BiConsumer<Measurement, CloseableHttpResponse>>();
#         startProcessorFeeder();
#         startMeasurementSentHandlerDispatcher();
#     }
#
#     private void startProcessorFeeder() {
#         new Thread(agentThreadGroup, () -> {
#             try {
#                 while (true) {
#                     Iterator<String> iterator = enqueuedMeasurementsWithConfig.keySet().iterator();
#
#                     if (!iterator.hasNext()) {
#                         sleep();
#                         continue;
#                     }
#
#                     String channelId = iterator.next();
#                     // Creates a new list because the returned collection is weak and if you remove all elements
#                     // from the multimap it will also remove from the returned collection
#                     Collection<MeasurementWithConfig> measurementsWithConfig = newArrayList(enqueuedMeasurementsWithConfig.asMap().get(channelId));
#
#                     Processor processor = processorPool.getProcessor(channelId);
#                     if (processor == null) {
#                         sleep();
#                         continue;
#                     }
#
#                     enqueuedMeasurementsWithConfig.removeAll(channelId);
#                     processor.process(measurementsWithConfig);
#                 }
#             } catch (InterruptedException e) {
#             }
#         }, "ProcessorFeeder").start();
#     }
#
#     private void startMeasurementSentHandlerDispatcher() {
#         new Thread(agentThreadGroup, () -> {
#             try {
#                 while (true) {
#                     Object[] array = sentMeasurementsWithContext.take();
#                     Measurement measurement = (Measurement) array[0];
#                     CloseableHttpResponse response = (CloseableHttpResponse) array[1];
#                     Agent.this.measurementSentHandlerList.forEach(measurementSentHandler -> measurementSentHandler.accept(measurement, response));
#                 }
#             } catch (InterruptedException e) {
#             }
#         }, "MeasurementSentHandlerDispatcher").start();
#     }
#
#     private void sleep() throws InterruptedException {
#         Thread.sleep(100L);
#     }
#
#     public void send(Measurement measurement, Config config) {
#         MeasurementWithConfig measurementWithConfig = new MeasurementWithConfig(measurement, config);
#
#         Processor processorAlreadyBoundToChannelId = processorPool.getProcessor(measurement.getId());
#         if (processorAlreadyBoundToChannelId != null) {
#             processorAlreadyBoundToChannelId.process(measurementWithConfig);
#             return;
#         }
#
#         enqueuedMeasurementsWithConfig.put(measurement.getId(), measurementWithConfig);
#     }
#
#     public void send(Collection<Measurement> measurements, Config config) {
#         Map<String, List<Measurement>> measurementGroups = measurements
#                 .parallelStream()
#                 .collect(Collectors.groupingBy(Measurement::getId));
#
#         measurementGroups.forEach((channelId, measurementsForChannelId) -> {
#             List<MeasurementWithConfig> measurementsWithConfig = measurementsForChannelId
#                     .stream()
#                     .map(measurement -> new MeasurementWithConfig(measurement, config))
#                     .collect(Collectors.toList());
#
#             Processor processorAlreadyBoundToChannelId = processorPool.getProcessor(channelId);
#             if (processorAlreadyBoundToChannelId != null) {
#                 processorAlreadyBoundToChannelId.process(measurementsWithConfig);
#                 return;
#             }
#
#             enqueuedMeasurementsWithConfig.putAll(channelId, measurementsWithConfig);
#         });
#     }
#
#     public void reportSentMeasurement(Measurement measurement, CloseableHttpResponse response) {
#         sentMeasurementsWithContext.add(new Object[]{measurement, response});
#     }
#
#     public MeasurementSentHandler addMeasurementSentHandler(BiConsumer<Measurement, CloseableHttpResponse> handler) {
#         MeasurementSentHandler measurementSentHandler = new MeasurementSentHandler() {
#             @Override
#             public BiConsumer<Measurement, CloseableHttpResponse> remove() {
#                 Agent.this.measurementSentHandlerList.remove(handler);
#                 return handler;
#             }
#         };
#         this.measurementSentHandlerList.add(handler);
#         return measurementSentHandler;
#     }
# }
