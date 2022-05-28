FROM node:16.14.0-alpine
LABEL COMPANY="orderbird"
WORKDIR /usr/src/app
COPY package.json .
# install dependencies
RUN yarn install

COPY public ./public
COPY src ./src
RUN pwd
RUN ls -l
ENTRYPOINT yarn start
