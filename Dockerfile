FROM node:18-alpine

WORKDIR /node-js-tests-sample

COPY package*.json ./

RUN npm install

COPY . .

RUN npm test

CMD [ "npm", "test" ]