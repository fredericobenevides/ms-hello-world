#!/bin/sh

pod_name=`oc get pods -o name | grep my-golang | awk -F '/' '{print $2}'`
oc rsync  ./app $pod_name:/go/src/ --watch &2> /dev/null
