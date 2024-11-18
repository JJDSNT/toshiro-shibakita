FROM mysql:5.7

ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=toshiro_db
ENV MYSQL_USER=usuario
ENV MYSQL_PASSWORD=senha

COPY banco.sql /docker-entrypoint-initdb.d/
