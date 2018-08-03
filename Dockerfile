FROM alpine
LABEL maintainer="ImageBetter"
WORKDIR /working_directory

RUN apk add --no-cache php7 php7-phar php7-json php7-openssl php7-mbstring git openssh
RUN wget --quiet --output-document /usr/local/bin/composer https://getcomposer.org/composer.phar
RUN chmod u+x /usr/local/bin/composer
RUN composer self-update

ENTRYPOINT ["composer"]