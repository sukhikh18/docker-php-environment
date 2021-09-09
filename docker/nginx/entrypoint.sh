#!/usr/bin/env bash

for f in $(find /var/www/docker/nginx/conf.d/ -name *.conf.template); \
	do envsubst '$APP_DOMAIN' < $f > "/etc/nginx/conf.d/$(basename $f .template)"; done
nginx

