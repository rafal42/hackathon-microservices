require 'sinatra'
require 'json'
require 'bunny'

configure do
  set :server, :puma
end

post '/process_task' do
  connection = Bunny.new('amqp://guest:guest@0.0.0.0:5672')
  connection.start

  channel = connection.create_channel
  data = JSON.parse(request.body.read.to_s)
  queue = channel.queue(data['queue'].to_s)

  channel.default_exchange.publish(data['message'], routing_key: queue.name)
  connection.close

  { status: 201, queue_name: queue.name }
end
