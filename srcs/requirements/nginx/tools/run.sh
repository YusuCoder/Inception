# #!/bin/sh

mkdir -p $WP_PATH
chown -R www-data $WP_PATH

openssl req -x509 -nodes -days 365 \
-subj "/C=DE/ST=Heilbronn/L=Heilbronn/O=42/OU='${MYSQL_USER}'/CN='${DOMAIN_NAME}'" \
-newkey rsa:2048 -keyout $CERTS_KEY -out $CERTS_CRT

sed -i 's|DOMAIN_NAME|'${DOMAIN_NAME}'|g' /etc/nginx/sites-available/default.conf
sed -i 's|WP_PATH|'${WP_PATH}'|g' /etc/nginx/sites-available/default.conf
sed -i 's|PHP_HOST|'${PHP_HOST}'|g' /etc/nginx/sites-available/default.conf
sed -i 's|PHP_PORT|'${PHP_PORT}'|g' /etc/nginx/sites-available/default.conf
sed -i 's|CERTS_KEY|'${CERTS_KEY}'|g' /etc/nginx/sites-available/default.conf
sed -i 's|CERTS_CRT|'${CERTS_CRT}'|g' /etc/nginx/sites-available/default.conf

ln -sf /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

nginx -g "daemon off;"




# #!/bin/sh

# mkdir -p $WP_PATH
# chown -R www-data $WP_PATH


# openssl req -x509 -nodes -days 365 \
# -subj "/C=FR/ST=Paris/L-Paris/0=42/OU'${MYSQL_USER}'/CN='${DOMAIN_NAME}'" -newkey rsa:2048 \
# -keyout $CERTS_KEY -out $CERTS_CRT

# sed -i 's|DOMAIN_NAME|'${DOMAIN_NAME}'|g' /etc/nginx/sites-available/default.conf
# sed -i 's|WP_PATH|'${WP_PATH}'|g' /etc/nginx/sites-available/default.conf
# sed -i 's|PHP_HOST|'${PHP_HOST}'|g' /etc/nginx/sites-available/default.conf
# sed -i 's|PHP_PORT|'${PHP_PORT}'|g' /etc/nginx/sites-available/default.conf
# sed -i 's|CERTS_KEY|'${CERTS_KEY}'|g' /etc/nginx/sites-available/default.conf
# sed -i 's|CERTS_CRT|'${CERTS_CRT}'|g' /etc/nginx/sites-available/default.conf


# nginx -g "daemon off;"


#needs improvement



# ALREADY_EXISTS='false'

# check_env() {
# 	i=0
# 	while read var; do
# 		content=$(eval "echo \${$var}")
# 		if [ -z "$content" ]; then
# 			echo "You need to specify $var"
# 			i=$((i+1))
# 		fi
# 	done << EOF
# DOMAIN_NAME
# EOF

# 	if [ $i -gt 0 ]; then
# 		exit 1
# 	fi
# }

# main() {
# 	if [ -f "/certs/cert.crt" ] && [ -f "/certs/cert.key" ]; then
# 		ALREADY_EXISTS='true'
# 	fi

# 	if [ "$ALREADY_EXISTS" = 'false' ]; then
# 		echo "Generating self-signed certificate..."
# 		openssl req -x509 -nodes -days 365 \
# 			-subj "/C=FR/ST=FR/O=42, School./CN=$DOMAIN_NAME" \
# 			-addext "subjectAltName=DNS:$DOMAIN_NAME" \
# 			-newkey rsa:4096 \
# 			-keyout /certs/cert.key \
# 			-out /certs/cert.crt;
# 		echo "Self-signed certificate generated."
# 	else
# 		echo "Certificate already exists"
# 	fi

# 	sed -i "s/DOMAIN_NAME/$DOMAIN_NAME/g" /etc/nginx/nginx.conf
# }

# main $@
# exec $@
