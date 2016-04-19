#!/bin/bash
chown www-data:www-data /app -R
usermod -u 1000 www-data

if [ "$ALLOW_OVERRIDE" = "**False**" ]; then
    unset ALLOW_OVERRIDE
else
    sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf
    a2enmod rewrite
fi

if [ "$DOCUMENT_ROOT" = "**Fales**" ]; then
    unset DOCUMENT_ROOT
else
    sed -i "s'DocumentRoot /var/www/html'DocumentRoot ${DOCUMENT_ROOT}'g" /etc/apache2/sites-available/000-default.conf
fi

source /etc/apache2/envvars
tail -F /var/log/apache2/* &
exec apache2 -D FOREGROUND
