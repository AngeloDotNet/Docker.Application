FROM rabbitmq:3.12.6-management
#FROM rabbitmq:3.11.19-management
#FROM rabbitmq:3.11.16-management

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -y install tzdata
RUN ln -fs /usr/share/zoneinfo/Europe/Rome /etc/localtime 
RUN dpkg-reconfigure --frontend noninteractive tzdata