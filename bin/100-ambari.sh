#!/bin/bash
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
  create database ambari;
  \connect ambari
  CREATE SCHEMA ambari AUTHORIZATION $POSTGRES_USER;
  ALTER SCHEMA ambari OWNER TO $POSTGRES_USER;
  ALTER ROLE $POSTGRES_USER SET search_path to 'ambari', 'public';
  \i /etc/ambari/Ambari-DDL-Postgres-CREATE.sql
EOSQL
