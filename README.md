## Docker заготовка для разработки на php под nginx 
- MySql 5.7 | MySql 8 | MariaDB (+ arm)
- Nginx ^1.*
- Memcached
- PHP 7.4 | PHP 8.0
- XDebug
- Composer
- MailHog

### Быстрый старт
Скопируйте пример настроек, отредактируйте и запустите docker.
```
cp .env.example .env
docker-compose up -d
```

### База данных
Используйте папку `./app/backup` для создания/восстановления резервной копии базы данных.  
```
cat /var/www/backup/site*.sql | mysql --host=db --user=admin --password="admin" app
```
_Для восстановления_

```
mysqldump --user=admin --password="admin" --no-tablespaces app > /var/www/backup/site-`date '+%Y%m%d'`.sql
```
_Для создания_

> Используйте хост `db` вместо `localhost` для соединения с базой данных внутри сайта (контейнера).

### Поддомены
Сервер читает папки внутри `./app/` при обращении к поддомену.
К примеру, создайте папку `./app/docs/` для домена docs.localhost
> Для использования не существующего домена добавляйте правило в hosts файл.

### Ча.в.о.

Как запустить командную строку внутри контейнера? (К примеру, для создания резервной копии базы данных)
> Командой `docker exec -i ${PROJECT}_db bash`

Как использовать Xdebug?
> В настройках IDE добавить локальный сервер с указанием абсолютного пути для `./app/public` на `/var/www/public`.
