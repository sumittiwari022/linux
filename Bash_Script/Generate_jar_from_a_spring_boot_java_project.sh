#!/bin/bash
set -e

  
echo "Enter the service name: "  
read service 
echo "Enter the Enviroment"  
read env

if [ "$service" = "service1" ]; then
echo "$service and $env"
cd location_to_the_service1_folder
git branch
git checkout $env
git branch
git pull origin $env
mvn clean package
echo " Jar Created for $service Service with Env as $env "

elif [ "$service" = "service2" ]; then
echo "$service and $env"
cd location_to_the_service2_folder
git branch
git checkout $env
git branch
git pull origin $env
mvn clean package
echo " Jar Created for $service Service with Env as $env "

else
echo "Wrong Choice... thanks"
fi
