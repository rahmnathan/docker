#!/bin/bash

# Run on a cron to backup important persistence files to s3.
# Does not include actual media files as they're too large (expensive/slow).

echo "Backing up Nextcloud"
aws s3 sync /srv/dev-disk-by-uuid-7575780d-60b1-4880-8bfb-542729db3165/PersistentVolumes/nextcloud-nextcloud-nextcloud-pvc-b066e9e8-ed1a-49b2-870a-bcd7f34f9c74 s3://homelab-volume-backup/nextcloud
echo "Backing up Audiobook Metadata"
aws s3 sync /srv/dev-disk-by-uuid-7575780d-60b1-4880-8bfb-542729db3165/PersistentVolumes/audiobookshelf-audiobookshelf-metadata-pvc-bf9381ec-29a8-4ad5-98db-e53c471cb60e s3://homelab-volume-backup/audiobooks/metadata
echo "Backing up Audiobooks"
aws s3 sync /srv/dev-disk-by-uuid-7575780d-60b1-4880-8bfb-542729db3165/PersistentVolumes/audiobookshelf-audiobookshelf-audiobooks-pvc-9d0f5a35-54a8-433e-8cb2-89d848c1ea60 s3://homelab-volume-backup/audiobooks/audiobooks
echo "Backing up Audiobook config"
aws s3 sync /srv/dev-disk-by-uuid-7575780d-60b1-4880-8bfb-542729db3165/PersistentVolumes/audiobookshelf-audiobookshelf-config-pvc-978826b0-36a1-403e-afea-376fe8fea26a s3://homelab-volume-backup/audiobooks/config
echo "Backing up Jenkins"
aws s3 sync /srv/dev-disk-by-uuid-7575780d-60b1-4880-8bfb-542729db3165/PersistentVolumes/jenkins-jenkins-pvc-803d5de6-356c-44dc-b57b-47dec9cb94d6 s3://homelab-volume-backup/jenkins
echo "Backing up postgres"
aws s3 sync /srv/dev-disk-by-uuid-7575780d-60b1-4880-8bfb-542729db3165/PersistentVolumes/postgres-data-postgresql-0-pvc-ea7ef126-bc56-4b63-9ae3-6ffe14c98f25 s3://homelab-volume-backup/postgres
