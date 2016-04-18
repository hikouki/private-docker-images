#!/bin/bash

if [ $HTTPD_USER_ID ]; then
    usermod -u $HTTPD_USER_ID apache
fi

exec supervisord -n
