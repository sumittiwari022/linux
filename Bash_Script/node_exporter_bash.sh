#!/bin/bash

set -e

ID=$(grep -oP '(?<=^ID_LIKE=).+' /etc/os-release | tr -d '"')
echo $ID
var="debian"

if [ "$ID" = "$var" ]; then
sudo adduser --no-create-home --disabled-login --shell /bin/false node_exporter
echo "user added"
curl -LO https://github.com/prometheus/node_exporter/releases/download/v1.1.2/node_exporter-1.1.2.linux-386.tar.gz
echo "wget done"
tar -xvzf node_exporter-1.1.2.linux-386.tar.gz
echo "tar done"
mv node_exporter-1.1.2.linux-386 node_exporter
echo "mv done"
cd node_exporter
echo "cd done"
sudo cp node_exporter /usr/local/bin/
echo "cpy done"
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter
echo "ownership change"
#sudo touch /etc/systemd/system/node_exporter.service
sudo echo -e "[Unit]\nDescription=Node Exporter\n[Service]\nUser=node_exporter\nGroup=node_exporter\nType=simple\nExecStart= /usr/local/bin/node_exporter\nRestart=on-failure\nRestartSec=5\n[Install]\nWantedBy=multi-user.target">node_exporter.service
echo "service file created"
sudo mv node_exporter.service /etc/systemd/system/node_exporter.service
echo "file moved"
sudo systemctl daemon-reload
echo "daemon reloaded"
sudo systemctl start node_exporter.service
echo "node exporter started"
sudo systemctl enable node_exporter.service
echo "enabled"

else
cd /tmp
curl -LO https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz
echo "downloaded"
tar -xvf node_exporter-0.18.1.linux-amd64.tar.gz
echo "extracted"
sudo mv node_exporter-0.18.1.linux-amd64/node_exporter /usr/local/bin/
echo "moved"
sudo useradd -rs /bin/false node_exporter
echo "added a user"
sudo echo -e "[Unit]\nDescription=Node Exporter\n[Service]\nUser=node_exporter\nGroup=node_exporter\nType=simple\nExecStart= /usr/local/bin/node_exporter\nRestart=on-failure\nRestartSec=5\n[Install]\nWantedBy=multi-user.target">node_exporter.service
echo "service file created"
sudo mv node_exporter.service /etc/systemd/system/node_exporter.service
echo "moved"
sudo systemctl daemon-reload
echo "reloaded"
sudo systemctl start node_exporter
echo "started"
sudo systemctl enable node_exporter
echo "enabled"
fi
