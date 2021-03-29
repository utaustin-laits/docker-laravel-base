# docker-laravel-base
Base Docker image for Laravel apps

## Use as a web server
Should work fine as-is.  Add your code to /var/www/html and you're good to go.
```
FROM ...

ADD server /var/www/html
RUN chmod 777 -R /var/www/html/bootstrap/cache
RUN chmod 777 -R /var/www/html/storage
```

## Use as a cron runner
This image has Supercronic installed.  Add your crontab file and tell Supercronic to run it.
```
FROM ...

COPY worker/crontab /etc/cron.d/laravel

ADD server /var/www/html
RUN chmod 777 -R /var/www/html/bootstrap/cache
RUN chmod 777 -R /var/www/html/storage

CMD['supercronic','/etc/cron.d/laravel']
```

## CHANGELOG

### 8.x-php8.0
Initial public release
