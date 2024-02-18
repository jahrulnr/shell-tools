#!/bin/sh

dir=/opt/container-log
log=/var/log/containerlog

echo "--- Install Start ---"

mkdir -p ${dir}
mkdir -p ${log}

sed -i "s|--log--|${log}|g" collect-logs.sh
sed -i "s|--dir--|${dir}|g" containerlog.service
sed -i "s|--log--|${log}|g" rotate.conf

cp collect-logs.sh ${dir}/
cp containerlog.service ${dir}/
cp rotate.conf ${dir}/

chmod +x ${dir}/collect-logs.sh
mkdir -p /etc/systemd/system/
ln -s ${dir}/containerlog.service /etc/systemd/system/containerlog.service
ln -s ${dir}/rotate.conf /etc/logrotate.d/container_log

systemctl daemon-reload
systemctl enable containerlog
systemctl start containerlog

echo "--- Install End ---"