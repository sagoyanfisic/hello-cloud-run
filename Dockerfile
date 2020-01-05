FROM node:10

WORKDIR /usr/src/app

ENV PORT 8080
ENV HOST 0.0.0.0

COPY package*.json ./

RUN npm install --only=production

# Copy the local code to the container
COPY . .
########################
# download the cloudsql proxy binary
RUN wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O /build/cloud_sql_proxy
RUN chmod +x /build/cloud_sql_proxy

# copy the wrapper script and credentials
#COPY run.sh /build/run.sh
#COPY credentials.json /build/credentials.json




#########################

# Build production app
# RUN npm run Build
#tun
# Start the service
CMD npm start
