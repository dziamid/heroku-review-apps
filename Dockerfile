#Grab the latest alpine image
FROM node:20-alpine
WORKDIR /opt/webapp

# Install dependencies
ADD ./express/package.json ./package.json
ADD ./express/package-lock.json ./package-lock.json
RUN npm install

# Add our code
ADD ./express .

# Run the image as a non-root user
RUN adduser -D myuser
USER myuser

CMD ["npm", "start"]

