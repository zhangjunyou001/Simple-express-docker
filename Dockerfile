FROM node:14

RUN apt-get update && \
    apt-get install rpm


RUN rpm --rebuilddb \
&& yum -y install java-1.8.0-openjdk.x86_64

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./

RUN npm install

# Bundle app source
COPY . .

EXPOSE 3000
CMD [ "node", "index.js" ]
