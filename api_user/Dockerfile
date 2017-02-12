FROM ruby:2.4.0

RUN apt-get update -qq && apt-get install -y nodejs

RUN mkdir -p /var/www/api

WORKDIR /tmp
COPY ./src/Gemfile Gemfile
COPY ./src/Gemfile.lock Gemfile.lock
RUN bundle install

ADD . /var/www/api
WORKDIR /var/www/api