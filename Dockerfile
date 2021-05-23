FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN apt-get -y install nginx apache2-utils openssl

# Generate self-signed certificate for learning purposes
RUN mkdir /etc/nginx/ssl &&\
    openssl req -x509 -days 10 -nodes -newkey rsa:2048 -keyout /etc/nginx/ssl/self.key -out /etc/nginx/ssl/self.crt -batch

# Generate DH Param
RUN openssl dhparam -out /etc/nginx/ssl/dhparam.pem 2048

EXPOSE 80

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]