#!/usr/bin/env bash

docker-compose exec postgres1 sh -c "/wal-g delete retain FIND_FULL 30 --confirm"
