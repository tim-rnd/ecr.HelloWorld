#!/bin/bash
echo "create task def: task-def..."
aws ecs register-task-definition --cli-input-json file://./task-def.json > task-def-output.json
cat task-def-output.json