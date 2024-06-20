#!/usr/bin/env bash

# Deploy config secret
oc apply -f ./openshift/xml-to-json-mqtt-secret.yaml

# Deploy Camel-K integration
kamel run xml-to-json-mqtt.camel.yaml \
--resource file:xml-to-textblock.xslt \
--resource file:xml-to-json.xslt \
--config secret:xml-to-json-mqtt-secret \
--trait health.enabled=true \
--trait health.liveness-probe-enabled=true \
--trait health.readiness-probe-enabled=true \
--trait prometheus.enabled=true \
--trait jolokia.enabled=true \
--trait jolokia.protocol=https \
--trait jolokia.use-ssl-client-authentication=true \
--trait jolokia.ca-cert=/var/run/secrets/kubernetes.io/serviceaccount/service-ca.crt \
--trait jolokia.client-principal=cn=hawtio-online.hawtio.svc \
--trait container.request-cpu=10m \
--trait container.request-memory=256Mi \
--trait container.limit-cpu=500m \
--trait container.limit-memory=256Mi \
--trait tracing.enabled=true \
--trait tracing.endpoint=http://jaeger-es-collector.observability.svc:14268/api/traces