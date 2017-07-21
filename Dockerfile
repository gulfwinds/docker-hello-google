FROM node:8.1.4-alpine

RUN mkdir /wwwroot
COPY nginx/nginx.conf /etc/nginx/nginx.conf

ADD public /wwwroot

EXPOSE 80
