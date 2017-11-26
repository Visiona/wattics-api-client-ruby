module ComWatticsInternal

  class Client

    def send_http_response(measurement, config)
      http_connection = build_connection(config)
      measurement = measurement.to_hash
      json = JSON.generate(measurement)

      response = http_connection.post do |req|
        puts "posting req"
        puts json
        puts req
        req.headers['Content-Type'] = 'application/json'
        # req.params = measurement
        req.body = json
      end

      puts response.status
      puts response.success?

      return response
    end

    def build_connection(config)
      url = config.get_uri
      username = config.get_username
      password = config.get_password

      Faraday.new(:url => url) do |builder|
        builder.request   :retry
        builder.request   :url_encoded
        builder.response  :logger
        builder.request   :basic_auth, username, password
        builder.adapter   Faraday.default_adapter
      end

    end

  end

end

# package com.wattics.internal;

# import com.wattics.Config;
# import com.wattics.Measurement;
# import org.apache.http.auth.UsernamePasswordCredentials;
# import org.apache.http.client.methods.CloseableHttpResponse;
# import org.apache.http.client.methods.HttpPost;
# import org.apache.http.entity.StringEntity;
# import org.apache.http.impl.client.BasicCredentialsProvider;
# import org.apache.http.impl.client.CloseableHttpClient;
# import org.apache.http.impl.client.HttpClients;
#
# import java.io.IOException;
#
# import static org.apache.http.auth.AuthScope.ANY;
#

# public class Client {
#     public CloseableHttpResponse send(Measurement measurement, Config config) throws IOException {
#         String uri = config.getUri();
#         CloseableHttpClient httpClient = buildClient(config);
#
#         HttpPost httpPost = new HttpPost(uri);
#
#         String json = JsonUtils.serialize(measurement);
#         StringEntity entity = new StringEntity(json);
#         httpPost.setEntity(entity);
#         httpPost.setHeader("Accept", "application/json");
#         httpPost.setHeader("Content-type", "application/json");
#
#         CloseableHttpResponse response = httpClient.execute(httpPost);
#         response.close();
#
#         return response;
#     }
#
#     private CloseableHttpClient buildClient(Config config) {
#         String username = config.getUsername();
#         String password = config.getPassword();
#
#         BasicCredentialsProvider credentialsProvider = new BasicCredentialsProvider();
#         UsernamePasswordCredentials credentials = new UsernamePasswordCredentials(username, password);
#         credentialsProvider.setCredentials(ANY, credentials);
#
#         return HttpClients
#                 .custom()
#                 .setDefaultCredentialsProvider(credentialsProvider)
#                 .build();
#     }
# }
