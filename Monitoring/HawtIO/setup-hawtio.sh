#!/usr/bin/env bash

# Deploy hawtio operator using OLM
oc apply -f ./manifests/hawtio-operator_subscription.yaml
sleep 30
oc wait --for=condition=available --timeout=600s deployment/hawtio-operator

# Deploy grafana instance
oc apply -f ./manifests/hawtio_cr.yaml