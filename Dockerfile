FROM nginx

#Copy configuration over
COPY nginx/nginx.conf /etc/nginx/nginx.conf
#Add webpage
ADD public /wwwroot/public

EXPOSE 80

