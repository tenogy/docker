#!/usr/bin/env bash

docker-compose stop postgres2
docker-compose run --rm postgres2 sh -c 'rm -rf $PGDATA/* && /wal-g backup-fetch $PGDATA LATEST; touch $PGDATA/recovery.signal'
docker-compose up -d postgres2