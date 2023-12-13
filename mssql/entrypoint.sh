#!/usr/bin/env bash
set -m
/opt/mssql/bin/sqlservr & ./run-initialization.sh
fg
