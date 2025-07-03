# PHP Dockerfile
#

### CLI ###

FROM ubuntu:noble AS cli

# Fixes some weird terminal issues such as broken clear / CTRL+L
ENV TERM=linux

# Ensure apt doesn't ask questions when installing stuff
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends gnupg \
    && echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu noble main" > /etc/apt/sources.list.d/ondrej-php.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C \
    && apt-get update \
    && apt-get -y --no-install-recommends install \
        ca-certificates \
        curl \
        unzip \
        php8.4-apcu \
        php8.4-cli \
        php8.4-curl \
        php8.4-mbstring \
        php8.4-opcache \
        php8.4-readline \
        php8.4-xml \
        php8.4-zip \
    	supervisor \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

#CMD ["php", "-a"]

# PHP-FPM packages need a nudge to make them docker-friendly
COPY overrides.conf /etc/php/8.4/fpm/pool.d/z-overrides.conf

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# CMD ["/usr/sbin/php-fpm8.4", "-O" ]
CMD ["/usr/bin/supervisord"]

# Open up fcgi port
EXPOSE 9000

ADD ./conf.d/*.ini /etc/php/8.4/cli/conf.d/

# RUN usermod -u 1000 www-data

WORKDIR /var/www
