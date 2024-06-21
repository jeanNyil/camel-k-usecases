#!/usr/bin/env bash

# Deploy grafana
oc apply -f ./manifests/grafana.yaml

# Deploy the Prometheus Gradana Datasource
# /!\ Make sure the access token is CORRECT
# Get the token secret from the service account: oc describe sa grafana-oauth-sa
# Get the token from the secret. E.g., oc extract secret/grafana-oauth-sa-token-28tc2 --to=-
oc apply -f ./manifests/prometheus_grafanadatasource.yaml

# Deploy the Camel Grafana Dashaboards
oc apply -f ./manifests/camel-route-metrics_grafanadashboard.yaml
oc apply -f ./manifests/camel-pod-metrics_grafanadashboard.yaml