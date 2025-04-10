# Use official PHP image with Composer and Node.js
FROM php:8.2-fpm

# Install system dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    jpegoptim optipng pngquant gifsicle \
    unzip git curl libzip-dev libpq-dev \
    && docker-php-ext-configure zip \
    && docker-php-ext-install pdo pdo_pgsql zip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www

# Copy everything (fallback method)
COPY . .

# Install PHP dependencies (with verbose output for debugging)
RUN composer install --no-interaction --prefer-dist --optimize-autoloader -vvv || true

# Install Node.js and build assets
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && npm install && npm run build || true

# Fix permissions
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

# Expose port
EXPOSE 8000

# Run Laravel migrations and serve
CMD php artisan migrate --force && php artisan serve --host=0.0.0.0 --port=8000
