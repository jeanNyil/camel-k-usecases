#!/usr/bin/env bash

# Deploy config secret
oc apply -f ./openshift/csv-to-json-mqtt-secret.yaml

# Run integration
kamel run csv-to-json-mqtt.camel.yaml \
--config secret:csv-to-json-mqtt-secret \
--trait health.enabled=true \
--trait health.liveness-probe-enabled=true \
--trait health.readiness-probe-enabled=true \
--trait prometheus.enabled=true \
--trait tracing.enabled=true \
--trait tracing.endpoint=http://jaeger-es-collector.observability.svc:14268/api/traces \
--dependency camel:csv