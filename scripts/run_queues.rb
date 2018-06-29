consumer_id = 0
queues = %w[queue_1 queue_2 queue_3 queue_4 queue_5]

queues.each do |queue|
  2.times do
    `docker run -d --link rabbit:rabbit -v LogsVolume:/app/logs hackathon_consumer ruby run.rb #{queue} #{consumer_id}`
    consumer_id += 1
  end
end
