# pull official base image
FROM node:13.12.0

# A directory within the virtualized Docker environment
# Becomes more relevant when using Docker Compose later
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
# Copies package.json and package-lock.json to Docker environment
COPY package*.json ./

RUN npm install --silent
RUN npm install react-scripts -g --silent
 

# add app
COPY . ./

# start app
CMD ["npm", "start"]