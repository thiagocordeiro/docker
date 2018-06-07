FROM phusion/baseimage

RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

RUN apt-get update --fix-missing && apt-get upgrade -y
RUN apt-get install nano unzip wget

RUN echo 'LC_ALL=en_US.UTF-8' >> /etc/environment
RUN echo 'LANG=en_US.UTF-8' >> /etc/environment
RUN echo 'LC_CTYPE=en_US.UTF-8' >> /etc/environment
ADD build/.bashrc /root/.bashrc

# java
RUN apt-get install default-jdk -y

# elasticsearch
RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" | tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list
RUN apt-get update && apt-get -y install elasticsearch
RUN echo -e "\nnetwork.host: 0.0.0.0" >> /etc/elasticsearch/elasticsearch.yml
RUN service elasticsearch start

# kibana
RUN echo "deb http://packages.elastic.co/kibana/4.5/debian stable main" | tee -a /etc/apt/sources.list.d/kibana-4.5.x.list
RUN apt-get update && apt-get -y install kibana
RUN service kibana start

# logstash
RUN echo 'deb http://packages.elastic.co/logstash/2.2/debian stable main' | tee /etc/apt/sources.list.d/logstash-2.2.x.list
RUN apt-get update && apt-get install logstash
RUN service logstash start

ADD build/logstash.conf /etc/logstash/conf.d/logstash.conf

# setup startup
ADD build/start.sh /etc/my_init.d/start.sh
RUN chmod +x /etc/my_init.d/start.sh

WORKDIR /root

CMD ["/sbin/my_init"]
