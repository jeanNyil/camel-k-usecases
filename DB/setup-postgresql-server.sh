#!/usr/bin/env bash

oc new-app postgresql-persistent \
-p MEMORY_LIMIT="512Mi" \
-p DATABASE_SERVICE_NAME="postgres" \
-p POSTGRESQL_USER="postgres" \
-p POSTGRESQL_PASSWORD="P@ssw0rd" \
-p POSTGRESQL_DATABASE="sampledb" \
-p VOLUME_CAPACITY="5Gi" \
-p POSTGRESQL_VERSION="15-el9"