#!/usr/bin/env bash

docker-compose exec postgres1 sh -c '/wal-g backup-push -f $PGDATA'