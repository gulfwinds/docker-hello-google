FROM nginx

EXPOSE 80

# Enable nginx
RUN rm -f /etc/service/nginx/down

# Copy in app and config files
RUN rm /etc/nginx/conf.d/default.conf

ADD nginx/webapp.conf /etc/nginx/sites-enabled/webapp.conf
ADD . /home/app/webapp


