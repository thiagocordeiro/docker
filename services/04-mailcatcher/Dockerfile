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

# mysql

RUN apt-get install build-essential libsqlite3-dev ruby-dev -y
RUN gem install mailcatcher

ADD build/mailcatcher_start.sh /etc/my_init.d/mailcatcher_start.sh
RUN chmod +x /etc/my_init.d/mailcatcher_start.sh

WORKDIR /root

CMD ["/sbin/my_init"]
