# Docker Application
There are currently the following templates:

## Application
- Kong
- Konga
- Rabbit-MQ
- Redis
- Postfix (Only SMTP Relay)
- Postgres Admin
- Ubuntu Server 20.04 - NET Core 3.x
- Ubuntu Server 20.04 - NET Core 5.x

## Network configuration
The docker-lan network (bridge type) was created with the command: 

> docker network create --driver=bridge --subnet=192.168.100.0/24 docker-lan

## Application configuration
For the Kong (Postgres 13.1) and Konga (Postgres 9.6) database it is necessary to first create the relative docker database (respecting the version indicated) and then create USER and DATABASE as indicated below.

For the Postgres Admin before starting the docker it is necessary to set the necessary permissions on the volume bind /var/lib/pgadmin via the command: chown -R 5050: 5050 var/lib/pgadmin

### Important
Before starting the related Kong and Konga dockers, modify the USERNAME, PASSWORD and DATABASE NAME indicated in the relevant dockers and compose with the same data used in the commands previously used to create USER and DATABASE. 

Also change the IP-SERVER-DOCKER parameter by replacing it with the ip address of the server hosting the dockers. 

The dockers kong-migration and konga-migration, present in the docker compose of Kong and Konga, are used only for the first time to create the database structures for the corresponding services.