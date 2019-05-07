require 'socket'

ip = 'localhost'
port = 5678
server = TCPServer.new(ip, port)
puts "Started server. Listening at port #{port}."

while client = server.accept
  request = client.readpartial(2048)
  puts "#{Time.now} - #{request}"
end