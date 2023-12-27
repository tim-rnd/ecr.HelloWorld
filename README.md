# ecr.HelloWorld
AWS ECR HelloWorld Container Registery Container Services (EC2/Fargate) R&amp;D

# STEP 1: Create a task def
Task def is a json file for docker defs (image, ports, volumes..etc)
$create-task-def.sh <= register the task def json file into ecs 
# STEP 2: Build the task
$build-task.sh <= create an image from Dockerfile
# STEP 3: Create Service on ECS
Define ECS cluster, a Service in the cluster, use the Task Def  + parameters (count, FARGATE/EC2, Networks subnets, pubIP? )
$create-service.sh