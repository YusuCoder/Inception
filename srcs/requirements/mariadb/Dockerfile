FROM alpine:10.6.14

RUN addgroup -S mysql
RUN adduser --disabled-password --ingroup mysql mysql

RUN apk add --no-cache mariadb mariadb-client su-exec

COPY tools/docker-entrypoint.sh /usr/local/bin/

EXPOSE 3306
ENTRYPOINT ["sh", "/usr/local/bin/docker-entrypoint.sh"]
CMD ["mariadbd"]


# ENV MYSQL_ROOT_PASSWORD=supersecure
# ENV MYSQL_DATABAASE=wordpress
# ENV MYSQL_USER=wp_user
# ENV MYSQL_PASSWORD=wp_password


# EXPOSE 3306

# VOLUME /var/lib/mysql
