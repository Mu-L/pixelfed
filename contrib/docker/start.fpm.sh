#!/bin/bash

# Create the storage tree if needed and fix permissions
cp -r storage.skel/* storage/
chown -R www-data:www-data storage/ bootstrap/

# Refresh the environment
php artisan config:cache
php artisan storage:link
php artisan horizon:publish
php artisan route:cache
php artisan view:cache

# Finally run FPM
php-fpm
