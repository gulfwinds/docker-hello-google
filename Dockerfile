FROM node:8.1.4-alpine

RUN mkdir /wwwroot
RUN mkdir /wwwroot/healthz

COPY nginx/nginx.conf /etc/nginx/nginx.conf

COPY docker-entrypoint.sh /etc/nginx/docker-entrypoint.sh
RUN chmod +x /etc/nginx/docker-entrypoint.sh

ADD public /wwwroot
ADD healthz /wwwroot/healthz

EXPOSE 80

ENTRYPOINT ["/etc/nginx/docker-entrypoint.sh"]
CMD ["/usr/sbin/nginx"]
