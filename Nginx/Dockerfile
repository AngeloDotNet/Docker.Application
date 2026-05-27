FROM nginx:1.31.1
#FROM nginx:1.29.7

COPY /root_image /

RUN apt update -y
RUN apt install -y software-properties-common
RUN add-apt-repository -y ppa:certbot/certbot
RUN apt install -y python3-certbot-nginx