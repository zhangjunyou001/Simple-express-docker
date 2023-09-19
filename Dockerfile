FROM node:14

RUN pip3 install xlrd==1.2.0 -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com \
        && pip3 install pymysql -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com \
        && pip3 install redis -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com 
# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./

RUN npm install

# Bundle app source
COPY . .

EXPOSE 3000
CMD [ "node", "index.js" ]
