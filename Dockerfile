#IMAGE BASE
FROM debian:buster

#Maintainer
MAINTAINER bouykourne omar <obouykou@student.1337.ma>

#Update and Upgrade

RUN  apt-get update -y
RUN apt-get upgrade -y

#install nginx, mariadb, php resources

RUN apt-get install nginx -y
RUN apt install mariadb-server -y
RUN apt-get install php-fpm php-mysql -y
RUN apt-get install -y php-mbstring php-zip php-gd php-xml php-pear php-gettext php-cgi
RUN apt-get install -y php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip 

#Copy resources to a system dir

COPY srcs/phpmyadmin /usr/bin/phpmyadmin
COPY srcs/default /usr/bin/default
COPY srcs/run.bash /usr/bin/run.bash
COPY srcs/wp /usr/bin/wp

RUN apt-get update

#RUN THE STARTUP COMMAND

CMD bash run.bash && bash
