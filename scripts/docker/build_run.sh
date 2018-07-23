#!/bin/sh

current_folder=`pwd`

cd app

docker build -t my-golang-app .

cd $pwd

docker run -it -p 80:80 --rm my-golang-app

