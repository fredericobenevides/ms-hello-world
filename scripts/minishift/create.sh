#!/bin/bash

PROJECT=${PROJECT:=myapp-test}
APP_NAME=${APP_NAME:=my-app}

# This adds anyuid and hostaccess security context constraints to default service account
# This is acceptable for a dev environment only
oc login -u system:admin
oc adm policy add-scc-to-user anyuid system:serviceaccount:$PROJECT:default
oc adm policy add-scc-to-user hostaccess system:serviceaccount:$PROJECT:default

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
