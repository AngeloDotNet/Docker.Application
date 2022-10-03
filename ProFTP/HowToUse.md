# Creazione Utenze

1. Definire dentro il file di configurazione /proftpd/conf.d/users.conf un riga che identifica il PATH della "directory chroot" esempio: DefaultRoot /data/test gruppo_test
dove **/data/test** è la directory chroot mentre **gruppo_test** è il gruppo PROFTP di appartenenza dell'utenza

2. Creare la "directory chroot" indicata nel file di conf per il punto 1 e dare i permessi opportuni (vedi esempio sotto)

3. Creare il gruppo PROFTP con il comando: ftpasswd --file /proftpd/etc/ftpd.group --group --gid 602 --name gruppo_test
dove **--gid 602** è il gid del gruppo (analogo al gid UNIX) e **--name gruppo_test** è il nome del gruppo (nell'esempio si sta creando un gruppo di nome gruppo_test)

4. Creare l'utenza PROFTP con il comando: echo "password" |ftpasswd --stdin --passwd --file=/proftpd/etc/ftpd.passwd --name=test --shell=/bin/bash --home=/home/test --uid 615 --gid 602
dove **password** è la password dell'utenza (nell'esempio si sta creando la password con la parola password), **--name=test** è il nome dell'utenza (nell'esempio si sta creando un'utenza di nome test), **--home=/home/test** è una qualunque home directory per l'utenza (verrà comunque ignorata dalle connessioni FTPe SFTP), **--uid 615** è analogo a uid UNIX e **--gid 603** è il gid del gruppo creato in precedenza (analogo al gid UNIX)

5. Fare il reload del servizio con il comando **service proftpd reload**

6. Eseguire un test di connessione

## Note

Per evitare problemi di permessi , uid e gid delle utenze proftp **non devono esistere a livello UNIX**

- Variabile **MAX_INSTANCES** (numero di connessioni contemporanee)
- Variabile **PORT_MAX** indica il numero più alto di porta effimera che viene aperta in modalita ftp passivemode
- Export tramite docker-compose di tutte le porte all'interno del range dichiarato con le variabili **PORT_MIN** e **PORT_MAX**