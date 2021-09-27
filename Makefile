up:
	docker-compose up --build -d

stop:
	docker-compose down

down:
	docker-compose down --remove-orphans

install:
	start
	install-composer
	install-deployer
	install-xdebug

install-composer:
	docker-compose exec php wget https://getcomposer.org/installer -O - -q \
   		| php -- --install-dir=/usr/local/bin --filename=composer --quiet \
   		&& php composer i

install-deployer:
	docker-compose exec php curl -L https://deployer.org/releases/v4.3.4/deployer.phar \
		> /usr/local/bin/dep && chmod +x /usr/local/bin/dep

# docker-php-ext-enable xdebug required?
install-xdebug:
	docker-compose exec php pecl install xdebug \
	    && echo "[xdebug]" > /usr/local/etc/php/conf.d/90-xdebug.ini \
	    && echo "zend_extension = xdebug.so" >> /usr/local/etc/php/conf.d/90-xdebug.ini \
	    && echo "xdebug.mode = debug,develop" >> /usr/local/etc/php/conf.d/90-xdebug.ini \
	    && echo "xdebug.start_with_request = yes" >> /usr/local/etc/php/conf.d/90-xdebug.ini \
	    && echo "# Replace host.docker.internal to your computers IP address if linux" >> /usr/local/etc/php/conf.d/90-xdebug.ini \
	    && echo "xdebug.client_host = host.docker.internal" >> /usr/local/etc/php/conf.d/90-xdebug.ini

bitrix-setup:
	docker-compose exec php wget http://www.1c-bitrix.ru/download/scripts/bitrixsetup.php -O bitrixsetup.php

bitirx-restore:
	docker-compose exec php wget http://www.1c-bitrix.ru/download/scripts/restore.php -O restore.php

