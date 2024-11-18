FROM php:7.4-fpm

WORKDIR /var/www/html

# Copiar os arquivos necessários
COPY index.php .
COPY nginx.conf /etc/nginx/nginx.conf

# Corrigir conflitos de repositórios e instalar pacotes necessários
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        nginx \
        libnginx-mod-http-geoip \
        libnginx-mod-http-image-filter \
        libnginx-mod-http-xslt-filter \
        libnginx-mod-mail \
        libnginx-mod-stream \
        libnginx-mod-stream-geoip \
        -o Dpkg::Options::="--force-confold" && \
    docker-php-ext-install mysqli && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

CMD service nginx start && php-fpm
