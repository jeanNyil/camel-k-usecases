#!/usr/bin/env bash

# Deploy config secret
oc apply -f ./openshift/postgresql-to-mqtt-and-file-secret.yaml

# Deploy Camel-K integration
kamel run postgresql-to-mqtt-and-file.camel.yaml \
--config secret:postgresql-to-mqtt-and-file-secret \
--trait health.enabled=true \
--trait health.liveness-probe-enabled=true \
--trait health.readiness-probe-enabled=true \
--trait prometheus.enabled=true \
--trait tracing.enabled=true \
--trait tracing.endpoint=http://jaeger-es-collector.observability.svc:14268/api/traces