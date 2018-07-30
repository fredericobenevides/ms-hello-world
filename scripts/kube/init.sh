#!/bin/sh

minikube start --vm-driver=virtualbox
eval $(minikube docker-env)

kubectl config use-context minikube
kubectl cluster-info

minikube dashboard
