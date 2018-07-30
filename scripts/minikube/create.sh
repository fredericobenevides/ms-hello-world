#!/bin/sh

kubectl create -f ./files/kubernetes/deployments.yaml
kubectl create -f ./files/kubernetes/services.yaml

kubectl rollout status deployment.apps/myapp-deployment

echo "Opening on browser"
open http://$(minikube ip):30008/hello-world
