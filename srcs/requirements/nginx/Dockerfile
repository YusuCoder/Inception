FROM alpine:latest

RUN apk update && apk add --no-cache nginx openssl

RUN mkdir -p /run/nginx /etc/nginx/certs

# FIX THIS LINE:
COPY conf/nginx.conf /etc/nginx/nginx.conf
# NOT into conf.d !!

COPY conf/nginx.crt /etc/nginx/certs/nginx.crt
COPY conf/nginx.key /etc/nginx/certs/nginx.key
COPY html/ /var/www/html/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
