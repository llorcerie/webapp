FROM ubuntu
MAINTAINER llor {lionel.lorcerie@devoteam.com}
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nginx git
EXPOSE 80
#ADD static-website-example/ /var/www/html/
#on automatise pour aller chercher directement sur github avec un git clone
RUN rm -rf /var/www/html/*
RUN git clone https://github.com/diranetafen/static-website-example.git /var/www/html/
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
