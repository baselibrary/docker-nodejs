FROM baselibrary/baseimage:1.0.0
MAINTAINER ShawnMa <qsma@thoughtworks.com>

## Version
ENV NODEJS_MAJOR   5
ENV NODEJS_VERSION 5.9.0-1nodesource1~trusty1

## Repository
RUN \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 68576280 &&\
  echo "deb https://deb.nodesource.com/node_5.x trusty main" > /etc/apt/sources.list.d/nodejs.list

## Packages
RUN \
  apt-get update &&\
  apt-get install -y nodejs=5.9.0-1nodesource1~trusty1 &&\
  rm -rf /var/lib/apt/lists/*

# Install Bower & Grunt 
RUN \
  npm install -g bower gulp-cli grunt-cli

