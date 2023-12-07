# Docker Application

There are currently the following templates:

## Application

- Event Store
- KeyCloak
- Grafana & Prometheus
- Kong
- Konga
- Rabbit-MQ
- Rabbit-MQ (2-node cluster mode)
- Redis
- Microsoft SDK - NET 6.x
- Nginx
- Postfix (Only SMTP Relay)
- Postgres Admin
- ProFTP (Server FTP)
- Seq
- Ubuntu Server 20.04 - NET 6.x
- Ubuntu Server 22.04 - NET 6.x (Version 21.04 update)
- Vault

If you like this repository, please drop a ⭐ on Github!


## Network configuration

The docker-lan network (bridge type) was created with the command: 

> docker network create --driver=bridge --subnet=192.168.100.0/24 docker-lan


## Application configuration

Regarding the configuration of the admin user (main user) for docker keycloak it is necessary after the docker has started to run the following commands: <b>docker exec <CONTAINER> /opt/jboss/keycloak/bin/add-user-keycloak.sh -u USERNAME -p PASSWORD</b> and subsequently: <b>docker restart CONTAINER</b>, taking care to replace the values indicated between minor and major before executing the commands just mentioned.

For the Kong (Postgres 13.1) and Konga (Postgres 9.6) database it is necessary to first create the relative docker database (respecting the version indicated) and then create USER and DATABASE as indicated below.

For the Postgres Admin before starting the docker it is necessary to set the necessary permissions on the volume bind /var/lib/pgadmin via the command: <b>chown -R 5050: 5050 var/lib/pgadmin</b>

For RabbitMQ (2-node cluster mode), after the two related dockers have been started, it is necessary to terminate the cluster configuration using these commands:
- docker exec rabbitNode2 rabbitmqctl stop_app
- docker exec rabbitNode2 rabbitmqctl join_cluster rabbit@node1.rabbit
- docker exec rabbitNode2 rabbitmqctl start_app
- docker exec rabbitNode1 rabbitmqctl set_policy ha "." '{"ha-mode":"all"}'

>**Nota:** Where ha is the name of the policy and the "." (dot) is the pattern and ha-mode set to "all" indicates that all queues must be high available. And to check the cluster status use the command **docker exec rabbitNode1 rabbitmqctl cluster_status**
  
For SEQ (docker version) the first boot occurs without any form of active login. After the docker is active, navigate to the SETTINGS > USERS section to enable authentication to access the dashboard.

For ElasticSearch before starting the docker you need to run the following command **sudo chown -R 1000:1000 data/** where the data/ folder is the volume folder indicated in the elastic compose docker.

### Important

Before starting the related Kong and Konga dockers, modify the USERNAME, PASSWORD and DATABASE NAME indicated in the relevant dockers and compose with the same data used in the commands previously used to create USER and DATABASE.

Also change the IP-SERVER-DOCKER parameter by replacing it with the ip address of the server hosting the dockers. 

The dockers kong-migration and konga-migration, present in the docker compose of Kong and Konga, are used only for the first time to create the database structures for the corresponding services.
