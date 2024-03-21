FROM php:8.3-fpm-alpine

ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN addgroup -g 1000 dark && adduser -G dark -g dark -s /bin/sh -D dark

RUN mkdir -p /var/www/portfolio

COPY ./../portfolio/ /var/www/portfolio

RUN docker-php-ext-install pdo pdo_mysql

RUN apk --no-cache add pcre-dev ${PHPIZE_DEPS} \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && apk del pcre-dev ${PHPIZE_DEPS}

RUN chown dark:dark /var/www/portfolio -R

RUN chmod -R 777 /var/www/portfolio/storage
RUN chmod -R 777 /var/www/portfolio/bootstrap/cache


