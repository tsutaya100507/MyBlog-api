FROM ruby:2.5

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /app-api
WORKDIR /app-api
COPY Gemfile /app-api/Gemfile
COPY Gemfile.lock /app-api/Gemfile.lock
RUN bundle install
COPY . /app-api
