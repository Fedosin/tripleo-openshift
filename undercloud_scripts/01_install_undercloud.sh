#!/bin/bash

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPTDIR/common.sh

sudo setenforce 0
sudo sed -i "s/^SELINUX=enforcing/SELINUX=permissive/" /etc/selinux/config

sudo usermod -a -G docker mistral
sudo systemctl restart openstack-mistral-executor
