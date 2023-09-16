FROM node:14

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY /tmp/git/Simple-express-docker/package.json /
COPY /tmp/git/Simple-express-docker/index.js /

RUN npm install

# Bundle app source
COPY . .

EXPOSE 3000
CMD [ "node", "index.js" ]
