#!/bin/bash

#possible settings : 
# - fargate-app : the working example for hellow World without ECR registry
# - helloworld : the simple http server including docker build - use with build
# - hahlabs : hahlabs/mysql|laravel|angular:dev image no build

ln -sf ./$1-task-def.json task-def.json
ln -sf ./$1-create-service.sh create-service.sh


./create-task-def.sh
# Check the exit status of the cp command
status=$?
if [ $status -eq 0 ]; then
  echo "task def created successfully"
else
  echo "task def creation failed : Exit code ($status)"
  exit 
fi
if [  "$1" = 'build' ]
 then 
    ln -sf ./$1-Dockerfile Dockerfile
    ln -sf ./$1-build-task.sh build-task.sh
   ./build-task.sh
fi
./create-service.sh