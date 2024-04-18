FROM mariadb:latest

COPY ./database/datenbank_uebungen.sql /docker-entrypoint-initdb.d/

EXPOSE 3306