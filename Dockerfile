# Dockerfile for Ubuntu 18.04 and Oracle Java 11
FROM ubuntu:18.04
MAINTAINER davigotxi

# Allows to add apt repositories
RUN apt-get update && apt-get -y upgrade && apt-get -y install software-properties-common
# Add java repo
RUN add-apt-repository ppa:linuxuprising/java -y && apt-get update

# Install Java 11
RUN (echo oracle-java11-installer shared/accepted-oracle-license-v1-2 select true | /usr/bin/debconf-set-selections) && apt-get install -y oracle-java11-installer oracle-java11-set-default

ENV JAVA_HOME /usr/lib/jvm/java-11-oracle
ENV PATH $JAVA_HOME/bin:$PATH
