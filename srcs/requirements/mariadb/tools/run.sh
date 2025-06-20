#!/bin/sh

sed -i 's|MYSQL_DATABASE|'${MYSQL_DATABASE}'|g' /tmp/init.sql
sed -i 's|MYSQL_USER|'${MYSQL_USER}'|g' /tmp/init.sql
sed -i 's|MYSQL_PASSWORD|'${MYSQL_PASSWORD}'|g' /tmp/init.sql
sed -i 's|MYSQL_ROOT_PASSWORD|'${MYSQL_ROOT_PASSWORD}'|g' /tmp/init.sql
sed -i 's|MYSQL_PORT|'${MYSQL_PORT}'|g' /etc/mysql/my.cnf
sed -i 's|MYSQL_ADDRESS|'${MYSQL_ADDRESS}'|g' /etc/mysql/my.cnf

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
    echo "Database already exists."
    mysqld_safe &
else
    mysql_install_db
    mysqld --init-file="/tmp/init.sql" &
fi

# Waiting for MariaDB to be ready
until mysqladmin ping --silent -h "$MYSQL_ADDRESS" -P "$MYSQL_PORT" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD"; do
  echo "Waiting for MariaDB to be ready..."
  sleep 2
done

echo "MariaDB is ready."

wait
