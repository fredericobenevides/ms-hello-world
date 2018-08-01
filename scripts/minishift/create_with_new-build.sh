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

# Access the app folder to build
cd app

oc new-build --binary --name=$APP_NAME -l app=$APP_NAME
dep ensure; oc start-build $APP_NAME --from-dir=. --follow

oc new-app $APP_NAME

oc expose svc/$APP_NAME

oc rollout status dc/$APP_NAME
sleep 5

echo "Opening on browser"
host=`oc get routes  | grep $APP_NAME | awk '{print $2}'`
open http://$host/hello-world

