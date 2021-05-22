FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN apt-get -y install nginx apache2-utils

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]