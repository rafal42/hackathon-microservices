

words = %w[lorem ipsum dolor sit amet wiecej ipsum nie pamietam]
queues = %w[queue_1 queue_2 queue_3 queue_4 queue_5]

(1..20).map do
  Thread.new do
    1000.times do
      puts "writing"
      `curl -X POST localhost:4567/process_task -d '{"queue": "#{queues.sample}", "message": "#{words.sample(5).join}"}'`
    end
  end
end.map(&:join)
