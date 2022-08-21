#!/usr/bin/env bash

set -eux

sudo useradd -r -M -s /sbin/nologin zookeeper

rm -rf /tmp/apache-zookeeper-3.7.1-bin.tar.gz apache-zookeeper-*
wget -P /tmp https://dlcdn.apache.org/zookeeper/zookeeper-3.7.1/apache-zookeeper-3.7.1-bin.tar.gz
tar zxf /tmp/apache-zookeeper-3.7.1-bin.tar.gz
sudo mv apache-zookeeper-3.7.1-bin /usr/local/zookeeper


mkdir -p /data/zookeeper/{data,logs}
