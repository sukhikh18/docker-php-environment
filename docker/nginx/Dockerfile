FROM nginx:1.18

RUN apt-get update && apt-get -y --no-install-recommends install gettext-base \
	&& apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN rm -f /etc/nginx/conf.d/default.conf

ADD ./nginx.conf /etc/nginx/
ADD conf.d/*.conf /etc/nginx/conf.d/

RUN usermod -u 1000 www-data

CMD ["/var/www/docker/nginx/entrypoint.sh"]

EXPOSE 80
