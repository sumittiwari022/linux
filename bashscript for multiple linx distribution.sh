#!/bin/bash

ID=$(grep -oP '(?<=^ID_LIKE=).+' /etc/os-release | tr -d '"')
echo $ID
var="debian"
if [ "$ID" = "$var" ]; then
a="apt-get"
else
a="yum"
fi

sudo $a update -y
#sudo $a install default-jre -y
