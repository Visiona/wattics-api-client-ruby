require 'socket'
    server = TCPServer.new("localhost", 8080)
    loop do
        connection = server.accept

        # imaginary HTTP parser
        request = HTTP.parse(connection.gets)
        # Process the request and build a response
        # ... with your web application!!!
        connection.puts status
        connection.puts headers
        connection.puts body
        connection.close
    end
