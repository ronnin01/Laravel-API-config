FROM php:7.4-fpm-alpine  
RUN docker-php-ext-install pdo pdo_mysql sockets 
RUN curl -sS https://getcomposer.org/installer​ | php -- \      
    --install-dir=/usr/local/bin --filename=composer  
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer 
WORKDIR /app 
COPY . . 
RUN composer update

# Expose port 8000 to the outside world
EXPOSE 8000

# Run Laravel application
CMD php artisan serve --host=0.0.0.0 --port=8000
