#!/bin/bash

set -a
source .env-ops
echo $ENV

docker stack deploy --compose-file=<(docker-compose -f docker-compose.infra-ops.yml -f docker-compose-ops.yml config 2>/dev/null) $ENV

