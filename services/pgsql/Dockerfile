FROM phusion/baseimage

RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

RUN apt-get update --fix-missing
RUN apt-get upgrade -y
RUN apt-get install nano

RUN echo 'LC_ALL=en_US.UTF-8' >> /etc/environment
RUN echo 'LANG=en_US.UTF-8' >> /etc/environment
RUN echo 'LC_CTYPE=en_US.UTF-8' >> /etc/environment
ADD build/.bashrc /root/.bashrc

# postgres

RUN apt-get install -y postgresql postgresql-contrib

RUN mkdir -p /root/setup
ADD build/postgres_setup.sh /root/setup/postgres_setup.sh
RUN chmod +x /root/setup/postgres_setup.sh
RUN /root/setup/postgres_setup.sh

ADD build/postgres_init.sh /etc/my_init.d/postgres_init.sh
RUN chmod +x /etc/my_init.d/postgres_init.sh

WORKDIR /root

CMD ["/sbin/my_init"]
