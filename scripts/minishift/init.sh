#!/bin/sh

minishift start --vm-driver=virtualbox --cpus 4 --memory 4gb
# eval $(minishift docker-env)

# kubectl config use-context minikube
# kubectl cluster-info

# minikube dashboard
