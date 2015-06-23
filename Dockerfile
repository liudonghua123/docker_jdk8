############################################################
# Dockerfile to build JDK8 container images
# Based on Ubuntu
# Ref: repo.spring.io/libs-release/org/springframework/boot
# Ref: http://www.webupd8.org/2012/09/install-oracle-java-8-in-ubuntu-via-ppa.html
############################################################

# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
MAINTAINER Liudonghua <liudonghua123@gmail.com>

# Update the repository sources list
RUN apt-get update

################## BEGIN INSTALLATION ######################
# Install JDK8 Following the Instructions
# Ref: http://tecadmin.net/install-oracle-java-8-jdk-8-ubuntu-via-ppa/

# Install some prerequisites like add-apt-repository
RUN apt-get install -y python-software-properties software-properties-common

# Add ppa repository
RUN add-apt-repository -y ppa:webupd8team/java

# Update the repository sources list once more
RUN apt-get update

# Auto accept the license
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

# Install JDK8
RUN apt-get install -y oracle-java8-installer

# Configuring Java Environment
RUN apt-get install -y oracle-java8-set-default

# Uninstall prerequisites
RUN apt-get purge -y python-software-properties software-properties-common
##################### INSTALLATION END #####################