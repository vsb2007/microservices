#!/bin/bash

#set -a
#source ../.env-dev
/bin/bash -c "envsubst < /tmp/prometheus/prometheus.yml > /etc/prometheus/prometheus.yml"
/bin/bash -c "envsubst < /tmp/prometheus/alert.rules.yml > /etc/prometheus/alert.rules.yml"
#/bin/bash -c "envsubst < /tmp/prometheus/prometheus.yml > tt.txt"

/bin/prometheus --config.file=/etc/prometheus/prometheus.yml --storage.tsdb.path=/prometheus --web.console.libraries=/usr/share/prometheus/console_libraries --web.console.templates=/usr/share/prometheus/consoles
