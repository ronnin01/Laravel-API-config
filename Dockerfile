# Use the official PHP 8 image
FROM php:8

# Install dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    zip \
    unzip

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo_mysql zip

# Set working directory
WORKDIR /var/www/html

# Copy the application files to the container
COPY . .

# Install composer and dependencies
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install

# Expose port 80
EXPOSE 80

# Start the PHP built-in server
CMD ["php", "artisan", "serve", "--host", "0.0.0.0", "--port", "80"]
