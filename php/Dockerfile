FROM debian:jessie

# Install PHP
# Add PHP5.6 Repositories to sources.list
RUN echo 'deb http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list && \
    echo 'deb-src http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list && \
    wget https://www.dotdeb.org/dotdeb.gpg && \
    apt-key add dotdeb.gpg && \
    apt-get update && \
    apt-get install -y php5 php5-fpm php5-cli php5-intl php5-mcrypt php5-mysql php5-curl php5-xdebug

# Setting php5-fpm conf
RUN sed -i -e '/\;listen.owner/c\listen.owner = www-data' /etc/php5/fpm/pool.d/www.conf
RUN sed -i -e '/\;listen.group/c\listen.group = www-data' /etc/php5/fpm/pool.d/www.conf
RUN sed -i -e '/\;listen.mode/c\listen.mode = 666' /etc/php5/fpm/pool.d/www.conf

EXPOSE 9000
CMD ["php-fpm"]
