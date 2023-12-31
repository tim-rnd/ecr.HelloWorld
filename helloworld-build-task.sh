#!/bin/bash
echo "build image 479788010133.dkr.ecr.us-west-2.amazonaws.com/helloworld:latest ..."
docker buildx build -t 479788010133.dkr.ecr.us-west-2.amazonaws.com/helloworld:latest .
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 479788010133.dkr.ecr.us-west-2.amazonaws.com
docker push 479788010133.dkr.ecr.us-west-2.amazonaws.com/helloworld:latest