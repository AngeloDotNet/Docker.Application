FROM rabbitmq:4.0.3-management
#FROM rabbitmq:4.0.2-management

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -y install tzdata
RUN ln -fs /usr/share/zoneinfo/Europe/Rome /etc/localtime 
RUN dpkg-reconfigure --frontend noninteractive tzdata