#!/bin/bash

## https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack

# ## Verify if NodePool was passed
# if [ -z "$1" ]
# then
#  echo "NodePool is needed!"
#  exit 1
# fi

# Adding Helm Repos
# helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
# helm repo update

# Defining namespace
NAMESPACE=istio-system
CHART_NAME=kube-prometheus
NODEPOOL=$1

# Create namespace istio-system if it not exists
kubectl create ns ${NAMESPACE} || true

		# --set forceNamespace=$NAMESPACE \
		# --set server.nodeSelector."cloud\.google\.com/gke-nodepool"=$NODEPOOL \
		# --set kube-state-metrics.nodeSelector."cloud\.google\.com/gke-nodepool"=$NODEPOOL \

# Install Kube Prometheus Helm Chart
helm upgrade --install ${CHART_NAME} \
		--namespace $NAMESPACE \
		-f values.yaml \
		prometheus-community/kube-prometheus-stack

# Applying scraping configs
# kubectl -n ${NAMESPACE} apply -f prometheus-configmap.yaml