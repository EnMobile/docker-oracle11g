#!/usr/bin/env bash
docker build -t enmobile/oracle11gdb:step1 step1/.
export STEP1=`docker run -d --privileged -v ${PWD}/step2/install:/tmp/install -d enmobile/oracle11gdb:step1 sh -c 'tail -f /var/log/messages'`
docker exec -it $STEP1 sh -c 'cd /tmp/install/database/rpm && rpm -iv cvuqdisk-1.0.7-1.rpm'
docker exec -it $STEP1 sh -c 'cd /tmp/install/ && ./install.sh'
docker commit $STEP1 oracle-12c:installed
docker kill $STEP1
docker rm $STEP1
docker build -t oracle-11g:created step3/.
export STEP3=`docker run -d --privileged -v ${PWD}/step2/install:/tmp/install oracle-11g:created sh -c 'tail -f /var/log/messages'`
docker exec -it $STEP3 sh -c '/tmp/create'
docker commit $STEP3 oracle-11g:created
docker kill $STEP3
docker rm $STEP3
docker build -t enmobile/oracle11g step4/.