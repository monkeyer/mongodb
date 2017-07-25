 # Dockerizing MongoDB: Dockerfile for building MongoDB images
 # Based on ubuntu:latest

 FROM       ubuntu:latest

 MAINTAINER FanZheyuan <15950194@qq.com>

 # Installation:
 # Import MongoDB public GPG key AND create a MongoDB list file
 RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
 RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list

 # Update apt-get sources AND install MongoDB
 RUN apt-get update
 RUN apt-get install -y -q mongodb-org

 # Create the MongoDB data directory
 RUN mkdir -p /data/db

 # Expose port 27017 from the container to the host
 EXPOSE 27017

 # Set usr/bin/mongod as the dockerized entry-point application
 ENTRYPOINT usr/bin/mongod