#!/bin/sh

dir=/opt/varnish-log
log=/var/log/varnish-log

echo "--- Install Start ---"

mkdir -p ${dir}
mkdir -p ${log}

sed -i "s|--log--|${log}|g" processlog.sh
sed -i "s|--dir--|${dir}|g" start.sh
sed -i "s|--dir--|${dir}|g" varnishlog.service
sed -i "s|--log--|${log}|g" rotate.conf

cp processlog.sh ${dir}/
cp start.sh ${dir}/
cp varnishlog.service ${dir}/
cp rotate.conf ${dir}/

chmod +x ${dir}/processlog.sh
chmod +x ${dir}/start.sh
mkdir -p /etc/systemd/system/
ln -s ${dir}/varnishlog.service /etc/systemd/system/varnishlog.service
ln -s ${dir}/rotate.conf /etc/logrotate.d/varnish_log

systemctl daemon-reload
systemctl enable varnishlog
systemctl start varnishlog

echo "--- Install End ---"