FROM hauptmedia/proftpd

RUN ln -sf /usr/share/zoneinfo/Europe/Rome /etc/localtime
RUN apt -y update
RUN apt -y install ssh vim

COPY ./root /
RUN chmod 600 /etc/ssh/ssh_host*

RUN ln -fs /proftpd/etc/proftpd.conf /etc/proftpd/proftpd.conf
CMD ["sh", "-c","chmod 440 /proftpd/etc/ftpd.group; chmod 440 /proftpd/etc/ftpd.passwd ; proftpd --nodaemon"]
