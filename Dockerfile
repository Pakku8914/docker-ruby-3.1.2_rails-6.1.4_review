FROM ruby:3.1.2

USER root

# railsのインストール
RUN gem install rails -v 6.1.4

# node jsのインストール
WORKDIR /usr/src
RUN curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh && bash nodesource_setup.sh && apt-get update && apt-get install nodejs

# yarnのインストール
RUN npm install -g yarn

WORKDIR /usr/src
RUN mkdir /app_name
ENV APP_ROOT /usr/src/app_name
WORKDIR ${APP_ROOT}

COPY . $APP_ROOT

RUN bundle install