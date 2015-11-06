FROM ubuntu
MAINTAINER Neal Mi  <zhongwang.mi@kanche.com>

# Install TokuMX
RUN  apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A
RUN echo "deb http://repo.percona.com/apt "$(lsb_release -sc)" main" | sudo tee /etc/apt/sources.list.d/percona.list
RUN apt-get update
RUN apt-get install -y percona-server-mongodb
RUN sed -i'' -e '/logpath/d' /etc/mongod.conf
RUN rm -rf /var/lib/apt/lists/*

# Define mountable directories.
VOLUME ["/data/db"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["mongod"]

# Expose ports [ process port and http port ]
EXPOSE 27017
EXPOSE 28017
