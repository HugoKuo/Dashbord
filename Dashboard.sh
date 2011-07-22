#!/bin/bash
rm -r /opt/osdb
cd /opt
sudo easy_install virtualenv
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
#cd /opt/osdb/openstack-dashboard/
sleep 3
echo "=====Setup Environment and Sync Databasei====="
sleep 2
sudo tools/with_venv.sh dashboard/manage.py syncdb
sleep 2
echo "=====Please excute #sudo tools/with_venv.sh dashboard/manage.py runserver 0.0.0.0:8000====="
