FROM node:8.1.4-alpine

RUN mkdir /wwwroot
RUN mkdir /wwwroot/healthz

COPY nginx/nginx.conf /etc/nginx/nginx.conf

ADD public /wwwroot
ADD healthz /wwwroot/healthz

EXPOSE 80

ENTRYPOINT ["exec nginx -c /etc/nginx/nginx.conf -g "daemon off;""]
CMD ["/usr/sbin/nginx"]
