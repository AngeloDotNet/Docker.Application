FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -y install tzdata
RUN ln -fs /usr/share/zoneinfo/Europe/Rome /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN apt install -y wget vim

RUN wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb

RUN apt-get update
RUN apt-get install -y apt-transport-https

RUN apt-get update
RUN apt-get install -y dotnet-sdk-6.0

RUN apt-get update
RUN apt-get install -y aspnetcore-runtime-6.0

ENV ASPNETCORE_URLS=http://*:5001
ENV ASPNETCORE_ENVIRONMENT="production"

EXPOSE 5001
WORKDIR /app

ENTRYPOINT ["dotnet", "NOME-APP.dll"]