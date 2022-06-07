### Features
- MySql 5.7
- Nginx ^1.*
- PHP 7.4
- XDebug 3
- Composer

### Quick start
Copy environment settings and start docker from project root:
```
cp .env.example .env
docker-compose up -d
```

### Database
Move backup file (for ex. `backup.sql`) to root project directory and use restore database commands:
```
docker exec -i ${PROJECT}_db bash
cd /var/www/
cat backup.sql | mysql --host=db --user=admin --password=admin app
```
> Use db instead localhost for database connections.

### How to use XDebug
Add `./public` to `/var/www/public` for `Docker` server.

### Dynamic domains
Try docs.localhost for use`/var/www/docs/` (if it's available `docs/` in root) and show html.
