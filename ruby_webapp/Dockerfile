FROM ruby:2.3

COPY ./ /app
WORKDIR app

RUN bundle install

EXPOSE 4567

CMD ["ruby", "app.rb", "queue_name", "-o", "0.0.0.0"]
