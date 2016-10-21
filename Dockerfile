#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Docker container: latest
# Ubuntu 16.04 - Apache2 latest - PHP 7 (note)
# Phalcon latest
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#latest Ubuntu
FROM ubuntu:16.04

MAINTAINER Deka Truong <dekatruong@gmail.com>

# Apache2 (latest)
# PHP7-Module for Apache2
# Mysql Driver for Php7
# Phalcon
# Curl (to install Phalcon extension that currently has not published yet: https://phalconphp.com/en/download)
# Use Curl getting Repositories
# Phalcon for Php7
RUN apt update && \
	apt-get -y install apache2 \
	php7.0 libapache2-mod-php7.0 \
	php7.0-mysql \
	curl && \
	curl -s https://packagecloud.io/install/repositories/phalcon/stable/script.deb.sh | bash && \
	apt-get -y install php7.0-phalcon
	
# MongoDB Driver for Php7 (as soon as possible)
# RUN apt-get install -y  php7.0-mongodb
############################

###########################################
# Add Apache2 config file
ADD OSfile/etc/apache2/apache2.conf /etc/apache2/apache2.conf
ADD OSfile/etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf

# Web Folder
WORKDIR /var/www

# Give an example
RUN cd /var/www && \
	rm -rf /var/www/* && \
	apt-get -y install git && \
	git clone https://github.com/dekatruong/PhalconSkeletonWithPhalconBoot.git .

# Mount
#  (can edit config in runtime)
VOLUME ["/var/www", "/var/log/apache2","/etc/apache2/"]

# Port
EXPOSE 80

# Run Webserver (stop if incompletely-shutdown httpd)
#CMD service apache2 start
#CMD ["service", "apache2", "start"]
CMD rm -rf /run/httpd/* /tmp/httpd*
CMD apachectl -D FOREGROUND


