FROM debian:bullseye

RUN apt-get update -yq && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server mariadb-client && \
    mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chown -R mysql:mysql /etc/mysql

COPY ./tools/run.sh /tmp/
COPY ./conf/init.sql /tmp/
COPY ./conf/my.cnf /etc/mysql/

RUN chown -R mysql:mysql /tmp/ && \
    chown -R mysql:mysql /etc/mysql/

USER mysql

ENTRYPOINT ["sh", "/tmp/run.sh"]
