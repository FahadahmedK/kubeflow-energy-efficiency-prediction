#! /bin/sh

export PIPELINE_VERSION=1.7.0
kubectl apply -k "github.com/kubeflow/pipelines/manifests/kustomize/cluster-scoped-resources?ref=$PIPELINE_VERSION&timeout=300"
kubectl wait --for condition=established --timeout=300s crd/applications.app.k8s.io
kubectl apply -k "github.com/kubeflow/pipelines/manifests/kustomize/env/platform-agnostic-pns?ref=$PIPELINE_VERSION&timeout=300"
kubectl port-forward -n kubeflow svc/ml-pipeline-ui 8080:80
