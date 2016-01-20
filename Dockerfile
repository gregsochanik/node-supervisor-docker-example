FROM node:4.2 

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update -y
RUN apt-get upgrade -y --force-yes
RUN apt-get install -y --force-yes supervisor 

RUN mkdir /src

ADD index.js /src
ADD package.json /src

RUN cd /src && \
  npm install --production

## TODO - Now need to switch this to run supervisor with an optional supervisor.conf file - fail fast with missing conf file?

WORKDIR /src
EXPOSE 3000 

CMD npm start

