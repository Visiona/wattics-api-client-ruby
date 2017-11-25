require_relative './internal/client'


module ComWattics
  class ClientFactory

    # def set_instance=(clientFactory)
    #   @singleton_instance = ClientFactory.new
    # end

    def get_instance
      if @singleton_instance == nil
        @singleton_instance = ClientFactory.new
      end
      return @singleton_instance
    end

    def create_client
      return Client.new
    end

  end
end

# package com.wattics;
#
# import com.wattics.internal.Client;
#
# public class ClientFactory {
#     private static ClientFactory SINGLETON_INSTANCE;
#
#     public static void setInstance(ClientFactory clientFactory) {
#         SINGLETON_INSTANCE = clientFactory;
#     }
#
#     public static ClientFactory getInstance() {
#         if (SINGLETON_INSTANCE == null) {
#             SINGLETON_INSTANCE = new ClientFactory();
#         }
#         return SINGLETON_INSTANCE;
#     }
#
#     public Client createClient() {
#         return new Client();
#     }
# }
