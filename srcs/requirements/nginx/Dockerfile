FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y nginx openssl && \
    mkdir -p /etc/nginx/ssl /run/nginx && \
    chown -R www-data:www-data /var/lib/nginx && \
    rm -rf /etc/nginx/sites-available/default

COPY ./conf/default.conf /etc/nginx/sites-available/default.conf
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./tools/run.sh /tmp/run.sh

RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

EXPOSE 443

ENTRYPOINT ["sh", "/tmp/run.sh"]



# FROM debian:buster

# RUN apt update -y && \
# 	apt upgrade -y && \
# 	apt-get install -y nginx \
# 	openssl && \
# 	mkdir -p /etc/nginx/ssl && \
# 	mkdir -p /run/nginx && \
# 	chown -R www-data /var/lib/nginx && \
# 	rm -rf /etc/nginx/sites-available/default

# COPY ./conf/default.conf /etc/nginx/sites-available/default.conf
# COPY ./conf/nginx.conf /etc/nginx/nginx.conf
# COPY ./tools/run.sh /tmp/run.sh


# RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

# EXPOSE 443

# ENTRYPOINT [ "sh", "/tmp/run.sh" ]
