#!/bin/sh

# ALREADY_EXISTS='false'
# DATADIR='/wp'

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
# WORDPRESS_SITE_TITLE
# WORDPRESS_ADMIN_USER
# WORDPRESS_ADMIN_PASSWORD
# WORDPRESS_ADMIN_EMAIL
# WORDPRESS_DB_USER
# WORDPRESS_DB_PASSWORD
# WORDPRESS_DB_NAME
# EOF

# 	if [ $i -gt 0 ]; then
# 		exit 1
# 	fi
# }

# wait_db() {
# 	i=0
# 	while ! mysqladmin ping -hdb --silent; do
# 		sleep 2
# 		i=$((i+1))
# 		if [ $i -gt 60 ]; then
# 			echo "Can't connect to database after 2mins."
# 			exit 1
# 		fi
# 	done
# }

# main() {
# 	if [ -f "$DATADIR/wp-config.php" ]; then
# 		ALREADY_EXISTS='true'
# 	fi

# 	if [ "$ALREADY_EXISTS" = 'false' ]; then
# 		check_env
# 		echo "Waiting for database..."
# 		wait_db
# 		echo "Database is ready."
# 		echo "Installing WordPress..."

# 		wget -q -O - https://wordpress.org/latest.tar.gz | tar -xz -C $DATADIR --strip-components=1

# 		wp --path=$DATADIR config create \
# 			--dbname="$WORDPRESS_DB_NAME" \
# 			--dbuser="$WORDPRESS_DB_USER" \
# 			--dbpass="$WORDPRESS_DB_PASSWORD" \
# 			--dbhost="db:3306" \
# 			--dbprefix='wp_'

# 		wp --path=$DATADIR core install \
# 			--url="$DOMAIN_NAME" \
# 			--title="$WORDPRESS_SITE_TITLE" \
# 			--admin_user="$WORDPRESS_ADMIN_USER" \
# 			--admin_password="$WORDPRESS_ADMIN_PASSWORD" \
# 			--admin_email="$WORDPRESS_ADMIN_EMAIL"

# 		echo -e "\n✅ WordPress installation complete.\n"
# 	else
# 		echo "✅ WordPress is already installed."
# 	fi

# 	chown -R www-data:www-data $DATADIR
# 	echo "🔁 Starting PHP-FPM..."
# 	exec "$@"
# }

# if [ "$1" = 'php-fpm' ]; then
# 	main "$@"
# else
# 	exec "$@"
# fi















