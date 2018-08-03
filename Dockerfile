FROM alpine
LABEL maintainer="ImageBetter"
WORKDIR /working_directory

RUN apk add --no-cache php7 php7-phar php7-json php7-openssl php7-mbstring git openssh
RUN wget --quiet --output-document /usr/local/bin/composer https://getcomposer.org/composer.phar
RUN chmod u+x /usr/local/bin/composer
RUN composer self-update

RUN if [ ! -d /root/.ssh ]; then mkdir /root/.ssh; fi
RUN if [ -d /.ssh ]; then cp /.ssh/* /root/.ssh; fi
RUN chmod 700 /root/.ssh
RUN if [ -f /root/.ssh/id_rsa ]; then chmod 600 /root/.ssh/id_rsa; fi
RUN if [ -f /root/.ssh/id_rsa.pub ]; then chmod 644 /root/.ssh/id_rsa.pub; fi
RUN if [ -f /root/.ssh/known_hosts ]; then chmod 644 /root/.ssh/known_hosts; fi

ENTRYPOINT ["composer"]