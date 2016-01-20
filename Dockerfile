FROM node:4.2 

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update -y && \
  apt-get upgrade -y --force-yes && \
  apt-get install -y --force-yes supervisor 

RUN mkdir /src

ADD index.js /src
ADD package.json /src

RUN cd /src && \
  npm install --production

WORKDIR /
EXPOSE 3000 

CMD supervisord -c /supervisor/supervisor.conf

