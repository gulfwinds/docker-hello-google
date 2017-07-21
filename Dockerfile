############################################################
# Dockerfile to build Nginx Installed Containers
# Based on Ubuntu
############################################################
# Set the base image to Ubuntu
FROM ubuntu:14.04
# File Author / Maintainer
MAINTAINER Gulf Winds

# Download and Install Nginx
RUN sudo apt-get dist-upgrade
RUN sudo apt-get install -y nginx  

# Remove the default Nginx configuration file
RUN sudo rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directory
ADD nginx /etc/nginx/

# Expose ports
EXPOSE 80

# Set the default command to execute
# when creating a new container
CMD service nginx start
