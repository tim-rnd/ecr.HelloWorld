#!/bin/bash
echo "create task def: edudate-task-def..."
aws ecs register-task-definition --cli-input-json file://./edudate-task-def.json > edudate-task-def-output.json
cat edudate-task-def-output.json