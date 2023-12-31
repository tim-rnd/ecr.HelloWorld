docker logout
cat ~/docker-access-token.txt| docker login --username hahlabs --password-stdin
docker pull hahlabs/mysql:dev
docker logout
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 479788010133.dkr.ecr.us-west-2.amazonaws.com
docker tag hahlabs/mysql:dev 479788010133.dkr.ecr.us-west-2.amazonaws.com/hahlabs/mysql:latest
docker push 479788010133.dkr.ecr.us-west-2.amazonaws.com/hahlabs/mysql:latest