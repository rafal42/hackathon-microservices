Enqueue the task: `curl -X POST localhost:4567/process_task -d '{"queue": "queue_name", "message": "A message"}'`

Run rabbit: `docker run -p 5672:5672 --hostname rabbit --name rabbit rabbitmq`
Run webapp, linking to rabbit: `docker run -hackathon_webapp -p 4567:4567 --link rabbit:rabbit   --name hackathon_webapp hackathon_webapp`
Run consumer, linking to rabbit with Docker persistent volume: `docker run --link rabbit:rabbit -v LogsVolume:/app/logs hackathon_consumer ruby run.rb queue_1`
