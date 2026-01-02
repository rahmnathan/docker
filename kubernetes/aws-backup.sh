#!/bin/bash

# Run on a cron to backup important persistence files to s3.
# Does not include actual media files as they're too large (expensive/slow).

aws s3 sync /srv/dev-disk-by-uuid-7575780d-60b1-4880-8bfb-542729db3165/PersistentVolumes s3://homelab-volume-backup-2 --exclude "*monitoring-elasticsearch*" --exclude "*monitoring-logstash*" --exclude "*monitoring-prometheus-kube-prometheus-stack-prometheus-db*"
