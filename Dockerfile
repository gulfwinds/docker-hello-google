FROM node:8.1.4-alpine

RUN mkdir /wwwroot
RUN mkdir /wwwroot/healthz

COPY nginx/nginx.conf /etc/nginx/nginx.conf

COPY docker-entrypoint.sh /etc/nginx/docker-entrypoint.sh
RUN chmod +x /etc/nginx/docker-entrypoint.sh

ADD public /wwwroot
ADD healthz /wwwroot/healthz

EXPOSE 80

ENTRYPOINT ["exec nginx -c /etc/nginx/nginx.conf -g "daemon off;""]
CMD ["/usr/sbin/nginx"]
