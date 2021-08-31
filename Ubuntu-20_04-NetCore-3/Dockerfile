FROM ubuntu:20.04

RUN apt update -y && apt -y install wget vim

RUN DEBIAN_FRONTEND=noninteractive apt update -u && apt install -y tzdata
RUN ln -sf /usr/share/zoneinfo/Europe/Rome /etc/localtime

RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb

RUN apt update
RUN apt install -y apt-transport-https dotnet-sdk-3.1 aspnetcore-runtime-3.1

ENV ASPNETCORE_URLS=http://*:5001
ENV ASPNETCORE_ENVIRONMENT=”production”

EXPOSE 5001
WORKDIR /app

ENTRYPOINT ["dotnet", "NOME-APP.dll"]