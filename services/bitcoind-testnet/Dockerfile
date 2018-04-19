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
RUN apt-get install nano wget

RUN echo 'LC_ALL=en_US.UTF-8' >> /etc/environment
RUN echo 'LANG=en_US.UTF-8' >> /etc/environment
RUN echo 'LC_CTYPE=en_US.UTF-8' >> /etc/environment
ADD build/.bashrc /root/.bashrc

# bitcoind

RUN echo '* * * * * ( sleep 1; make /root generate BLOCKS=10 )' >> /var/spool/cron/crontabs/root
RUN echo '* * * * * ( sleep 11; make /root generate BLOCKS=10 )' >> /var/spool/cron/crontabs/root
RUN echo '* * * * * ( sleep 21; make /root generate BLOCKS=10 )' >> /var/spool/cron/crontabs/root
RUN echo '* * * * * ( sleep 31; make /root generate BLOCKS=10 )' >> /var/spool/cron/crontabs/root
RUN echo '* * * * * ( sleep 41; make /root generate BLOCKS=10 )' >> /var/spool/cron/crontabs/root
RUN echo '* * * * * ( sleep 51; make /root generate BLOCKS=10 )' >> /var/spool/cron/crontabs/root

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:bitcoin/bitcoin
RUN apt-get update

RUN apt-get install -y bitcoind make

ADD build/1 /root/1
ADD build/2 /root/2
ADD build/Makefile /root/Makefile

WORKDIR /root

CMD ["/sbin/my_init"]
