FROM nginx:latest

EXPOSE 80

# Enable nginx
RUN rm -f /etc/service/nginx/down

ADD public /usr/share/nginx/html

WORKDIR /usr/share/nginx/html
RUN mkdir healthz
ADD healthz /usr/share/nginx/html/healthz


# Copy in app and config files
RUN rm /etc/nginx/conf.d/default.conf

ADD nginx/webapp.conf /etc/nginx/sites-enabled/webapp.conf

RUN service nginx restart
