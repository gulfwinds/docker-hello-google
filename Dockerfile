FROM nginx

COPY nginx/nginx.conf /etc/nginx/nginx.conf

ADD public /wwwroot/public

EXPOSE 80

