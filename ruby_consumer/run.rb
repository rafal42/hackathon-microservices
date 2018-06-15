require 'bunny'

connection = Bunny.new('amqp://guest:guest@rabbit:5672')
connection.start

channel = connection.create_channel
queue = channel.queue(ARGV.first)

begin
  puts ' [*] Waiting for messages. To exit press CTRL+C'
  queue.subscribe(block: true) do |_delivery_info, _properties, body|
    puts " [x] Received #{body}"
  end
rescue Interrupt => _
  connection.close

  exit(0)
end
