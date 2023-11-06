#FROM redis:6.2
FROM redis:7.0.12

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -y install tzdata
RUN ln -fs /usr/share/zoneinfo/Europe/Rome /etc/localtime 
RUN dpkg-reconfigure --frontend noninteractive tzdata

COPY redis.conf /usr/local/etc/redis/redis.conf
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]
