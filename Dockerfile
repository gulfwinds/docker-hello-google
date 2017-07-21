############################################################
# Dockerfile to build Nginx Installed Containers
# Based on Ubuntu
############################################################
# Set the base image to Ubuntu
FROM nginx

# Remove the default Nginx configuration file
RUN rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directory
ADD nginx /etc/nginx/

# Enable nginx
RUN rm -f /etc/service/nginx/down

ADD public /usr/share/nginx/html

# Expose ports
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]


