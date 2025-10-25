# Docker Application

There are currently the following templates:

## Application

- ElasticSearch (Updated)
- Event Store
- Grafana & Prometheus
- KeyCloak
- Kong
- Konga
- Microsoft SDK - NET 8.x
- Nginx (Updated)
- OwnCloud (Updated)
- Postfix (Only SMTP Relay - Updated)
- Postgres Admin (Updated)
- ProFTP (Server FTP)
- Rabbit-MQ (Updated)
- Rabbit-MQ (2-node cluster mode) (Updated)
- Redis (Updated)
- Seq (Updated)
- Ubuntu Server 25.04 - NET 8.x (New release)
- Vault
- Vault Warden (Updated)

If you like this repository, please drop a ⭐ on Github!

## Network configuration

The docker-lan network (bridge type) was created with the command: 

> docker network create --driver=bridge --subnet=192.168.100.0/24 docker-lan

## Application configuration

After starting the KeyCloak docker for the first time, if you want to use it in HTTP mode and not in the standard HTTPS mode, you need to change the value of the SSL_REQUIRED column to NONE in the relevant database, REALM table, then restart the docker.

**Note:** KeyCloak versions 25.0.2 and 26.1.3 require a PostgreSQL version 16 database.

---

For the Kong (Postgres 13.1) and Konga (Postgres 9.6) database it is necessary to first create the relative docker database (respecting the version indicated) and then create USER and DATABASE as indicated below.

---

For the Postgres Admin before starting the docker it is necessary to set the necessary permissions on the volume bind /var/lib/pgadmin via the command: <b>chown -R 5050: 5050 var/lib/pgadmin</b>

---

For MinIO storage if you are using a localhost port configuration (example: 127.0.0.1:9000 and 127.0.0.1:9001), you will need to add these lines to the relevant nginx file in sites-enabled.

server {
   root /var/www/html/;
   index index.html index.htm;

   server_name minio.example.com; //To be replaced with the real server

   location / {
     proxy_set_header X-Real-IP $remote_addr;
     proxy_set_header X-Forwarded-For $remote_addr;
     proxy_set_header Host $host;
  
     proxy_http_version 1.1;
     proxy_set_header Upgrade $http_upgrade;
     proxy_set_header Connection "upgrade";
     proxy_read_timeout 86400;
 
     proxy_pass http://127.0.0.1:9001;
   }
}

---

For RabbitMQ (2-node cluster mode), after the two related dockers have been started, it is necessary to terminate the cluster configuration using these commands:

- docker exec rabbitNode2 rabbitmqctl stop_app
- docker exec rabbitNode2 rabbitmqctl join_cluster rabbit@node1.rabbit
- docker exec rabbitNode2 rabbitmqctl start_app
- docker exec rabbitNode1 rabbitmqctl set_policy ha "." '{"ha-mode":"all"}'

**Note:** Where ha is the name of the policy and the "." (dot) is the pattern and ha-mode set to "all" indicates that all queues must be high available. And to check the cluster status use the command **docker exec rabbitNode1 rabbitmqctl cluster_status**

To ensure that two nodes can belong to the same cluster, it is necessary to ensure that certain ports are accessible, in particular:

- 4369: epdm (ERLANG PORT MAPPER DAEMON), a peer discovery service, used by RabbitMQ nodes and CLI tools;
- 5672: port used by the AMQP protocol;
- 25672: used for communication between nodes and with the CLI;
- 35672-35682: used by CLI tools for communication with nodes;
- 15672: used for example for the UI management plugin.

---

For SEQ (docker version) the first boot occurs without any form of active login. After the docker is active, navigate to the SETTINGS > USERS section to enable authentication to access the dashboard.

---

For ElasticSearch before starting the docker you need to run the following command **sudo chown -R 1000:1000 data/** where the data/ folder is the volume folder indicated in the elastic compose docker.

### Important

Before starting the related Kong and Konga dockers, modify the USERNAME, PASSWORD and DATABASE NAME indicated in the relevant dockers and compose with the same data used in the commands previously used to create USER and DATABASE.

Also change the IP-SERVER-DOCKER parameter by replacing it with the ip address of the server hosting the dockers.

The dockers kong-migration and konga-migration, present in the docker compose of Kong and Konga, are used only for the first time to create the database structures for the corresponding services.
