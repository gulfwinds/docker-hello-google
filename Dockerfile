FROM node:8.1.4-alpine

RUN mkdir /wwwroot
RUN mkdis /wwwroot/heathz

COPY nginx/nginx.conf /etc/nginx/nginx.conf

ADD public /wwwroot
ADD heathz /wwwroot/heathz

EXPOSE 80
