#!/usr/bin/env bash

set -eux

id zookeeper >& /dev/null
if [ $? -ne 0 ]
then
    useradd -r -M -s /sbin/nologin zookeeper
fi

rm -rf /tmp/apache-zookeeper-3.7.1-bin.tar.gz apache-zookeeper-* /tmp/zookeeper /usr/local/zookeeper
wget -q -P /tmp https://dlcdn.apache.org/zookeeper/zookeeper-3.7.1/apache-zookeeper-3.7.1-bin.tar.gz
tar zxf /tmp/apache-zookeeper-3.7.1-bin.tar.gz
mv apache-zookeeper-3.7.1-bin /usr/local/zookeeper
chown -R zookeeper:zookeeper /usr/local/zookeeper

mkdir -p /data/zookeeper/{data,logs}
chown -R zookeeper:zookeeper /data/zookeeper
