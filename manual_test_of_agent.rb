require 'faraday'
require 'json'
require 'json/minify'

MYDEV = 'http://localhost:4567/readjson'

puts Faraday::VERSION
puts Faraday::default_adapter

username = 'asd'
password = '123'

# con = Faraday.new 'http://localhost:4567'
con = Faraday.new(:url => 'http://localhost:4567') do |faraday|
  faraday.request  :url_encoded             # form-encode POST params
  faraday.response :logger                  # log requests to STDOUT
  faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
end

puts con

res = con.post '/target', { :name => 'Jan' }

puts res.body
puts res.status

# http_client
#
# puts http_client.inspect
#
# # response = http_client.post do |req|
# #   # req.url 'http://localhost:4567/readjson'
# #   req.headers['Content-Type'] = 'application/json'
# #   req.params = measurement
# #   binding.pry
# #   req.body = '{"test": "am I here??"}'
# # end
#
# response = http_client.post '/target', { :name => 'Jan' }
#
# # puts response.headers['server']
# puts response.inspect
# puts response.status
# puts response.success?
