#!/bin/bash

sed -i "s/#listen_addresses = 'localhost'/listen_addresses='*'	/" /etc/postgresql/9.5/main/postgresql.conf
sed -i "s|127.0.0.1/32|0.0.0.0/0|" /etc/postgresql/9.5/main/pg_hba.conf

/etc/init.d/postgresql start

su postgres bash -c "psql -c \"CREATE USER root WITH PASSWORD 'root' SUPERUSER CREATEDB CREATEROLE INHERIT LOGIN;\""
