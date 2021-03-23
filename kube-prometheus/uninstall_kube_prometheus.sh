#!/bin/bash

# Define namespace
NAMESPACE=istio-system
CHART_NAME=kube-prometheus

# Uninstall Prometheus Helm Chart
helm -n $NAMESPACE delete ${CHART_NAME}

# Deleting CRD's
kubectl delete crd alertmanagerconfigs.monitoring.coreos.com
kubectl delete crd alertmanagers.monitoring.coreos.com
kubectl delete crd podmonitors.monitoring.coreos.com
kubectl delete crd probes.monitoring.coreos.com
kubectl delete crd prometheuses.monitoring.coreos.com
kubectl delete crd prometheusrules.monitoring.coreos.com
kubectl delete crd servicemonitors.monitoring.coreos.com
kubectl delete crd thanosrulers.monitoring.coreos.com
