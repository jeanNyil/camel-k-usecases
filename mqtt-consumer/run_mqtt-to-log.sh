#!/usr/bin/env bash

# Deploy config secret
oc apply -f ./openshift/mqtt-to-log-secret.yaml

# Deploy Camel-K integration
kamel run mqtt-to-log.camel.yaml \
--config secret:mqtt-to-log-secret \
--trait health.enabled=true \
--trait health.liveness-probe-enabled=true \
--trait health.readiness-probe-enabled=true \
--trait prometheus.enabled=true \
--trait tracing.enabled=true \
--trait tracing.endpoint=http://jaeger-es-collector.observability.svc:14268/api/traces