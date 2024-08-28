#we are attaching a base to our docker file
FROM ubuntu : 20.04
#we are giving naming and filtering keys and values to our image
LABEL DEVOPSENGG ="gaurav"
#we are installing few packeges in our image
RUN apt update
RUN apt install unzip apache2 -y
RUN rm -rf /var/www/html/index.html

#we are going to apache httpd's depoyment location i.e changing directory
WORKDIR /var/www/html/

#we are appending static website logic from remote server
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip

#we are running few commands in /var/www/html location
RUN unzip oxer.zip 
RUN mv oxer-html/*

#we are exposing our container to port 80 
EXPOSE 80

#we are running a background process for our image
CMD "httpd" "-DFOREGROUND"