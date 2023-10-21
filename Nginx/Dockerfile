FROM nginx:1.25.2
#FROM nginx:1.24.0
#FROM nginx:1.23.4
#FROM nginx:1.22.1
#FROM nginx:1.21.6
#FROM nginx:1.20.2
#FROM nginx:1.19.10
#FROM nginx:1.19.4
COPY /root_image /

RUN apt update -y
RUN apt install -y software-properties-common
RUN add-apt-repository -y ppa:certbot/certbot
RUN apt install -y python3-certbot-nginx