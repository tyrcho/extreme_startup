FROM ruby:1.9


RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
# ENV http_proxy=
RUN bundle install

COPY . /usr/src/app

EXPOSE 3000
CMD /usr/local/bin/ruby web_server.rb
