#!/usr/bin/env bash

for i in {01..05};
do
    hostname=$i.hadoop.1st.xjiaqing.apne;
    tmp_path=/data/temp/zookeeper
    echo "================================ ${hostname} =======================================";
    ssh ${hostname} "sudo mkdir -p ${tmp_path}; sudo chmod 777 ${tmp_path}";
    scp ./init.sh ${hostname}:${tmp_path}/init.sh;
    scp zoo.cfg ${hostname}:${tmp_path}/zoo.cfg;
    scp zookeeper.service ${hostname}:${tmp_path}/zookeeper.service;
    ssh ${hostname} "
        sudo ${tmp_path}/init.sh;
        sudo cp ${tmp_path}/zoo.cfg /usr/local/zookeeper/conf/;
        sudo cp ${tmp_path}/zookeeper.service /etc/systemd/system/zookeeper.service;
        sudo echo ${i} | sudo tee /data/zookeeper/data/myid > /dev/null;
        sudo systemctl daemon-reload && sudo systemctl restart zookeeper.service;
        sudo systemctl status zookeeper.service;
    "
done
