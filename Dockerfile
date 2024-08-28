#we are attaching a base to our docker file
FROM ubuntu:latest
#we are giving naming and filtering keys and values to our image
LABEL DEVOPSENGG ="GAURAV"
#we are installing few packeges in our image
RUN apt update
RUN apt install unzip apache2 -y
RUN rm -rf /var/www/html/index.html

#we are going to apache httpd's depoyment location i.e changing directory
WORKDIR /var/www/html/

#we are appending static website logic from remote server
COPY oxer-html /var/www/html

#we are exposing our container to port 80 
EXPOSE 80

#we are running a background process for our image
CMD ["apachectl", "-D", "FOREGROUND"]