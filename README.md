### Features
- MySql 5.7
- Nginx 1.10
- PHP 7.2
- XDebug 3
- Composer
- Deployer

### Quick start

```
cp .env.example .env
docker-compose up -d
```
### Database
Restore database commands
```
docker exec -i ${PROJECT}_db bash
cd /var/www/default/
cat backup.sql | mysql --host=db --user=bitrix --password=bitrix sitemanager
```
> Use db instead localhost in form for database connections.

### How to use XDebug
Add `./www/public` to `/var/www/default` for `Docker` server.
