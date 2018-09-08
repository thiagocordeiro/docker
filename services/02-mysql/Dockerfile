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
RUN apt-get install nano

RUN echo 'LC_ALL=en_US.UTF-8' >> /etc/environment
RUN echo 'LANG=en_US.UTF-8' >> /etc/environment
RUN echo 'LC_CTYPE=en_US.UTF-8' >> /etc/environment
ADD build/.bashrc /root/.bashrc

# mysql

RUN apt-get install -y mysql-server

RUN mkdir -p /root/setup
ADD build/mysql_setup.sh /root/setup/mysql_setup.sh
RUN chmod +x /root/setup/mysql_setup.sh
RUN /root/setup/mysql_setup.sh

ADD build/mysql_start.sh /etc/my_init.d/mysql_start.sh
RUN chmod +x /etc/my_init.d/mysql_start.sh
RUN /etc/my_init.d/mysql_start.sh

WORKDIR /root

CMD ["/sbin/my_init"]
