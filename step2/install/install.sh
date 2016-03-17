#!/bin/bash

mount -t tmpfs shmfs -o size=4g /dev/shm
usermod -u 1000 oracle
date
su -s /bin/bash oracle -c "cd /tmp/install/database/ && ./runInstaller -ignoreSysPrereqs -ignorePrereq -silent -noconfig -responseFile /tmp/install/db_install.rsp"
tail -f /u01/app/oraInventory/logs/installActions*.log &
while [ -n "`ps -ef | grep java | grep -v grep | grep -v defunct | awk '{ print $2 }'`" ]
do
    sleep 5
done