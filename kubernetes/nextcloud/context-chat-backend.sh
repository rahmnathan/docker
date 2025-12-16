#!/usr/bin/env bash

kubectl exec -it nextcloud-fcb86c455-xmpvh -- su -s /bin/sh www-data -c 'php occ app_api:app:unregister context_chat_backend'

kubectl exec -it nextcloud-fcb86c455-xmpvh -- su -s /bin/sh www-data -c 'php occ app_api:app:register context_chat_backend \
    manual_install \
    --json-info "{\"appid\":\"context_chat_backend\",\
                  \"name\":\"Context Chat Backend\",\
                  \"daemon_config_name\":\"manual_install\",\
                  \"version\":\"5.0.1\",\
                  \"secret\":\"12345\",\
                  \"port\":10034}" \
    --force-scopes \
    --wait-finish'
