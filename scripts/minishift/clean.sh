#!/bin/bash

PROJECT=${PROJECT:=myapp-test}

oc delete project $PROJECT
