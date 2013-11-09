FROM            ubuntu
MAINTAINER      Nicholas Johns "nicholas.a.johns5@gmail.com"

# Force update
# install python-software-properties for adding PPA's
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y python-software-properties

# Add node.js legacy (0.8) ppa
RUN add-apt-repository -y ppa:chris-lea/node.js-legacy
RUN apt-get update

#Install node.js
RUN apt-get install -y nodejs npm nodejs-dev

# Add repository contents
ADD . /srv/application/

# Change working dir (for ENTRYPOINT and CMD later)
WORKDIR /srv/application

# Install libraries locally
RUN npm install

# Expose port 80 to the host
EXPOSE 80

# The command executed on docker run, cannot be overwritten 
# allows you to run simply docker run image and /usr/bin/nodejs will be executed
# along with the arguments passed in the CMD directive
ENTRYPOINT ["/usr/bin/nodejs"]

# Default options, can pass nodejs flags here.
CMD ["server.js"]
