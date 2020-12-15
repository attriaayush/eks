FROM node:12-alpine

WORKDIR /opt/app/

COPY package*.json ./
ADD package.json /opt/app/package.json

RUN npm install
RUN npm install react-scripts@1.1.0 -g --silent

COPY . .

EXPOSE 3000

CMD ["npm", "start"]