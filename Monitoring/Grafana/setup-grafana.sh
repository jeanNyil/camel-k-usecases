#!/usr/bin/env bash

# Deploy grafana
oc apply -f ./manifests/grafana.yaml

# Deploy the Prometheus datasource
oc apply -f ./manifests/prometheus_grafanadatasource.yaml