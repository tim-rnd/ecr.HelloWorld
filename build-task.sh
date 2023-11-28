#!/bin/bash
echo "build image 479788010133.dkr.ecr.us-west-2.amazonaws.com/edudate:latest ..."
docker buildx build -t 479788010133.dkr.ecr.us-west-2.amazonaws.com/edudate:latest .
docker push 479788010133.dkr.ecr.us-west-2.amazonaws.com/edudate:latest