FROM ruby:2.1.10

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR .

COPY . .

RUN bundle install
CMD rspec

