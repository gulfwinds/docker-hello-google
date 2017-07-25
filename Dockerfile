FROM nginx

RUN mkdir /wwwroot
RUN mkdir /wwwroot/healthz

COPY nginx/nginx.conf /etc/nginx/nginx.conf

ADD public /wwwroot
ADD healthz /wwwroot/healthz

EXPOSE 80

