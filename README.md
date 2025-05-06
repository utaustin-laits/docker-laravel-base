# docker-laravel-base
Base Docker image for Laravel apps

## Use as a web server
Should work fine as-is.  Add your code to /var/www/html and you're good to go.
```
FROM ...

ADD server /var/www/html
```

## Changing the web server UID or GID
The image starts as `root`, but the web server runs as `www-data`.  You can change the UID that www-data runs as
(e.g. if you're mounting a volume, and want files written to that volume to have a particular owner).  You can
do this by setting the `WWW_UID` and `WWW_GID` environment variables, as in this docker compose YAML fragment: 
```
    environment:
      - WWW_UID=${UID:-1000}
      - WWW_GID=${GID:-1000}
```

## Use as an artisan runner
You can override the CMD with `php artisan your:command` to run any artisan command.
### Use as a queue worker
`php artisan queue:work --queue=your-queue-name`
### Use as a schedule runner
`php artisan schedule:work`


## CHANGELOG

### ubuntu-24.04 (PHP 8.3)
Newer `fpm`-based image.  Migration steps from the older images:
* Update the image name you're building from: ```FROM ghcr.io/utaustin-laits/laravel-base:ubuntu-24.04```
* If you're starting the container as specific user, remove that.  (You're likely doing this through a `user:` command in a docker compose YAML file.
  * Instead, add WWW_UID and WWW_GID environment variables, as described above.
* If you're using the old `docker-php-ext-configure` and `docker-php-ext-install` scripts in your Dockerfile, remove those.  You can now install these extensions using `apt install` instead.

### 12.x-php8.4 (and previous *-php* releases)
Older `mod_php`-based images; abandoned for performance reasons
