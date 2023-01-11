#!/bin/bash

MYSQL_HOST="127.0.0.1"
MYSQL_USER="root"
MYSQL_PASS="root"
MYSQL_DB="trade_summary"

mysql -h${MYSQL_HOST} -u${MYSQL_USER} -p${MYSQL_PASS} -e "create database ${MYSQL_DB}"

mysql -h ${MYSQL_HOST} -u ${MYSQL_USER} -p${MYSQL_PASS} ${MYSQL_DB} < create_trade_summary.sql
