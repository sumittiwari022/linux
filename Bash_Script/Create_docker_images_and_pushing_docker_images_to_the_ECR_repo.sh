#!/bin/bash
set -e

echo "Build and Pushing image to ECR
"

echo "Enter the service name: "  
read service 
echo "Enter the Enviroment"  
read env

if [ "$service" = "service1" ]; then
echo "$service and $env"
cd service1

if [ "$env" = "dev" ]; then
echo "$env"
sudo docker login -u AWS -p $(aws ecr get-login-password --region region_name) 962752321852.dkr.ecr.region_name.amazonaws.com
sudo docker build -f Dockerfile -t proposal .
sudo docker tag proposal:latest 962752321852.dkr.ecr.region_name.amazonaws.com/proposal:latest
sudo docker push 962752321852.dkr.ecr.region_name.amazonaws.com/proposal:latest

elif [ "$env" = "uat" ]; then
echo "$env"
sudo docker login -u AWS -p $(aws ecr get-login-password --region region_name) 962752321852.dkr.ecr.region_name.amazonaws.com
sudo docker build -f Dockerfile -t uatproposal .
sudo docker tag uatproposal:latest 962752321852.dkr.ecr.region_name.amazonaws.com/uat-proposal:latest
sudo docker push 962752321852.dkr.ecr.region_name.amazonaws.com/uat-proposal:latest

elif [ "$env" = "prod" ]; then
echo "$env"
sudo docker login -u AWS -p $(aws ecr get-login-password --region region_name) 962752321852.dkr.ecr.region_name.amazonaws.com
sudo docker build -f Dockerfile -t uatproposal .
sudo docker tag uatproposal:latest 962752321852.dkr.ecr.region_name.amazonaws.com/uat-proposal:latest
sudo docker push 962752321852.dkr.ecr.region_name.amazonaws.com/uat-proposal:latest
fi

elif [ "$service" = "service2" ]; then
echo "$service and $env"
cd service2

if [ "$env" = "dev" ]; then
echo "$env"
sudo docker login -u AWS -p $(aws ecr get-login-password --region region_name) 962752321852.dkr.ecr.region_name.amazonaws.com
sudo docker build -f Dockerfile -t payment .
sudo docker tag payment:latest 962752321852.dkr.ecr.region_name.amazonaws.com/payment:latest
sudo docker push 962752321852.dkr.ecr.region_name.amazonaws.com/payment:latest

elif [ "$env" = "uat" ]; then
echo "$env"
sudo docker login -u AWS -p $(aws ecr get-login-password --region region_name) 962752321852.dkr.ecr.region_name.amazonaws.com
sudo docker build -f Dockerfile -t uatpayment .
sudo docker tag uatpayment:latest 962752321852.dkr.ecr.region_name.amazonaws.com/uat-payment:latest
sudo docker push 962752321852.dkr.ecr.region_name.amazonaws.com/uat-payment:latest

elif [ "$env" = "prod" ]; then
echo "$env"
sudo docker login -u AWS -p $(aws ecr get-login-password --region region_name) 962752321852.dkr.ecr.region_name.amazonaws.com
sudo docker build -f Dockerfile -t uatpayment .
sudo docker tag uatpayment:latest 962752321852.dkr.ecr.region_name.amazonaws.com/uat-payment:latest
sudo docker push 962752321852.dkr.ecr.region_name.amazonaws.com/uat-payment:latest
fi

else
echo "Wrong Choice... thanks"
fi
