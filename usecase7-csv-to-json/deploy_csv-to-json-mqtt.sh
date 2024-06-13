#!/usr/bin/env bash

# Deploy config secret
oc apply -f ./openshift/csv-to-json-mqtt-secret.yaml

# Deploy Camel-K integration
kamel run csv-to-json-mqtt.camel.yaml \
--config secret:csv-to-json-mqtt-secret \
-d camel:csv \
--trait health.enabled=true \
--trait health.liveness-probe-enabled=true \
--trait health.readiness-probe-enabled=true \
--trait prometheus.enabled=true \
--trait jolokia.enabled=true \
--trait jolokia.protocol=https \
--trait jolokia.use-ssl-client-authentication=true \
--trait jolokia.ca-cert=/var/run/secrets/kubernetes.io/serviceaccount/service-ca.crt \
--trait jolokia.client-principal=cn=hawtio-online.hawtio.svc \
--trait tracing.enabled=true \
--trait tracing.endpoint=http://jaeger-es-collector.observability.svc:14268/api/traces \
--dependency camel:csv