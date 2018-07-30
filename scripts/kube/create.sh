#!/bin/sh

kubectl create -f ./files/kube/deployments.yaml
kubectl create -f ./files/kube/services.yaml

kubectl rollout status deployment.apps/myapp-deployment

echo "Opening on browser"
open http://$(minikube ip):30008/hello-world
