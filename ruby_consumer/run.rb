require 'bunny'

connection = Bunny.new('amqp://guest:guest@rabbit:5672')
connection.start

channel = connection.create_channel
queue_name, consumer_id = ARGV
queue = channel.queue(queue_name)

begin
  File.open('logs/logfile.log', 'a') do |file|
    file << "[*] Waiting for messages.\n"
  end
  queue.subscribe(block: true) do |_delivery_info, _properties, body|
    File.open('logs/logfile.log', 'a') do |file|
      file << "[x] [Consumer #{consumer_id}/#{queue_name}] received #{body}\n"
    end
  end
rescue Interrupt => _
  connection.close

  exit(0)
end
