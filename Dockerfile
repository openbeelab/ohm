FROM ruby:2.5
RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y build-essential nodejs
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app
