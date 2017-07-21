FROM node:8.1.4-alpine

RUN mkdir /wwwroot
COPY nginx/nginx.conf /etc/nginx/nginx.conf

WORKDIR /wwwroot
COPY public /wwwroot
RUN npm install --loglevel warn
RUN npm run build
RUN npm prune --production --loglevel warn

RUN apk add --no-cache nginx
EXPOSE 80
