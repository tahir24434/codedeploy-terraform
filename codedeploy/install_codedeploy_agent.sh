#!/usr/bin/env bash
sudo apt-get update;
sudo apt-get install python-pip;
# Ruby dep
sudo mkdir -p /etc/apt/sources.list.d
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C3173AA6
cat <<EOF | sudo tee /etc/apt/sources.list.d/brightbox-ubuntu-ruby-ng-wily.list
deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu wily main
EOF
sudo apt-get update
sudo apt-get install ruby2.0

cd /home/ubuntu;
wget https://aws-codedeploy-eu-central-1.s3.amazonaws.com/latest/install;
chmod +x ./install;
sudo ./install auto;


sudo systemctl start codedeploy-agent
sudo systemctl status codedeploy-agent