FROM phusion/baseimage

RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get update --fix-missing
RUN apt-get install -y nano

RUN echo 'LC_ALL=en_US.UTF-8' >> /etc/environment
RUN echo 'LANG=en_US.UTF-8' >> /etc/environment
RUN echo 'LC_CTYPE=en_US.UTF-8' >> /etc/environment
ADD build/.bashrc /root/.bashrc

# php-nginx
RUN update-rc.d -f apache2 remove
RUN apt-get install -y nginx-full
ADD build/nginx.conf /etc/nginx/sites-available/default

RUN apt-get install -y python-software-properties
RUN add-apt-repository -y ppa:ondrej/php
RUN apt-get update -y

RUN apt-get -y install php7.2
RUN apt-get -y install php7.2-fpm php7.2-common php7.2-cli php7.2-mysqlnd php7.2-curl php7.2-bcmath php7.2-mbstring php7.2-soap php7.2-xml php7.2-zip php7.2-json php7.2-pgsql php7.2-dev
RUN apt-get -y install git make

ADD build/xdebug_setup.sh /root/setup/xdebug_setup.sh
RUN chmod +x /root/setup/xdebug_setup.sh
RUN /root/setup/xdebug_setup.sh

RUN sed -i "s/;date.timezone =*/date.timezone = UTC/" /etc/php/7.2/fpm/php.ini
RUN sed -i "s/;date.timezone =*/date.timezone = UTC/" /etc/php/7.2/cli/php.ini
RUN sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.2/fpm/php.ini

ADD build/nginx_start.sh /etc/my_init.d/nginx_start.sh
ADD build/php-fpm_start.sh /etc/my_init.d/php-fpm_start.sh
RUN chmod +x /etc/my_init.d/nginx_start.sh /etc/my_init.d/php-fpm_start.sh

WORKDIR /root

CMD ["/sbin/my_init"]
