FROM ubuntu

RUN apt-get update && apt-get install ruby ruby-dev -y
RUN gem install bundler
COPY ./ /app
WORKDIR app

RUN bundle install

CMD ["ruby", "run.rb", "default_queue"]
