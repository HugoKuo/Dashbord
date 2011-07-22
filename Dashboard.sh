#!/bin/bash
rm -r /opt/osdb
cd /opt
if test -d /opt/.bzr
	then
		echo ".bzr already exist"
	else
		sudo bzr init-repo .
fi
sleep 4
echo "=====Start to get code from BZR====="
sudo bzr branch lp:openstack-dashboard -r 46 /opt/osdb
cd /opt/osdb
echo "=====Running TEST====="
sudo sh run_tests.sh
cd openstack-dashboard
echo "=====Copy local_settings.py template====="
cp /opt/local_settings.py  /opt/osdb/openstack-dashboard/local/
cd /opt/osdb/openstack-dashboard/
echo "=====Setup Environment and Sync Databasei====="
sudo tools/with_venv.sh dashboard/manage.py syncdb
echo "=====Please excute #sudo tools/with_venv.sh dashboard/manage.py runserver 0.0.0.0:8000====="
