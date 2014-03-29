FROM    ubuntu:precise

ENV     DEBIAN_FRONTEND noninteractive

# only later versions of collectd have the graphite plugin
RUN     echo "deb http://us.archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
RUN     echo "deb http://ppa.launchpad.net/vbulax/collectd5/ubuntu precise main" >> /etc/apt/sources.list
RUN     apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 232E4010A519D8D831B81C56C1F5057D013B9839
RUN     apt-get -y update
RUN     apt-get -y install collectd curl python-pip

# add a fake mtab for host disk stats
ADD     etc_mtab /etc/mtab

ADD     collectd.conf.tpl /etc/collectd/collectd.conf.tpl

RUN	pip install envtpl
ADD     start_container /usr/bin/start_container
RUN     chmod +x /usr/bin/start_container
CMD     start_container
