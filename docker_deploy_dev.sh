#!/bin/bash

set -a
source .env-dev
echo $ENV

docker stack deploy --compose-file=<(docker-compose -f docker-compose.infra.yml -f docker-compose.yml config 2>/dev/null) $ENV
