#!/bin/bash

PROJECT=${PROJECT:=myapp-test}
APP_NAME=${APP_NAME:=my-app}

echo "developer" | oc login -u developer

oc new-project $PROJECT \
  --display-name="My App Project" \
  --description="A golang hello world app" \
> /dev/null

oc project $PROJECT

oc new-app fredericobenevides/my-golang-app

oc expose svc/my-golang-app

oc rollout status dc/my-golang-app
sleep 5

echo "Opening on browser"
host=`oc get routes  | grep my-golang-app | awk '{print $2}'`
open http://$host/hello-world
