FROM nginx:1.27.5
#FROM nginx:1.29.0
#FROM nginx:1.27.4
COPY /root_image /

RUN apt update -y
RUN apt install -y software-properties-common
RUN add-apt-repository -y ppa:certbot/certbot
RUN apt install -y python3-certbot-nginx