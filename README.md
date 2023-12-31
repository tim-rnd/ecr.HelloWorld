# ecr.HelloWorld
AWS ECR HelloWorld Container Registery Container Services (EC2/Fargate) R&amp;D
Based on Hellow World ECR Tutorial

## STEP 1: Create a task def
Task def is a json file for docker defs (image, ports, volumes..etc)
$create-task-def.sh <= register the task def json file into ecs 
## STEP 2: Build the task
$build-task.sh <= create an image from Dockerfile
## STEP 3: Create Service on ECS
Define ECS cluster, a Service in the cluster, use the Task Def  + parameters (count, FARGATE/EC2, Networks subnets, pubIP? )
$create-service.sh

# HelloWorld
https://docs.aws.amazon.com/AmazonECS/latest/userguide/task_definition_parameters.html

Best is to avoid task def entryPoint / command

# HAHLABS
Task Exec Role: ecsTaskExecutionRole
Task Role: ecsTaskRole
   Policies:
      1. ecsEnableSSM : Enables full SSM
      2. ecsHAHLABS-MYSQL-logging : Enables Logging in CloudWatch /timy-rnd/ecs/hahlabs/mysql
      3. ecs-S3Logs: Enables Logging in S3 Bucket

replace task id
aws ecs execute-command  \
    --region $AWS_REGION \
    --cluster hahlabs-cluster \
    --task 360276fdb7c0438297715f833cb393bf \
    --container hahlabs-mysql \
    --command "/bin/bash" \
    --interactive

task-def.json:
only one &&, bash doesn't hold it, full path to executable
                "entryPoint": [
                    "/bin/sh", "-c" ,"/usr/bin/sudo ./start-services.sh && tail -f /dev/null"
                ],


aws ecs update-cluster --cluster hahlabs-cluster \
 --configuration executeCommandConfiguration="{logging=OVERRIDE,\
logConfiguration={cloudWatchLogGroupName="/timy-rnd/ecs/hahlabs",\
s3BucketName=timy-rnd.logs,\
s3KeyPrefix=exec-output}}"