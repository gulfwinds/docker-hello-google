FROM nginx:latest

EXPOSE 80

ADD public /usr/share/nginx/html

# Copy in app and config files
RUN rm /etc/nginx/conf.d/default.conf

ADD nginx/webapp.conf /etc/nginx/sites-enabled/webapp.conf

# Enable nginx
RUN rm -f /etc/service/nginx/down
