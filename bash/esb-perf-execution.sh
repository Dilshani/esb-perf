#!/bin/bash

echo "Starting remote Tomcat"
ssh -i chamaraa.pem ubuntu@$1 'export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/ubuntu/java/jdk1.8.0_121/bin;./tomcat/apache-tomcat-7.0.29/bin/catalina.sh start' &

echo "Starting remote ESB Server!"
ssh -i chamaraa.pem ubuntu@$2 'export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/ubuntu/java/jdk1.8.0_121/bin;./esb/wso2esb-5.0.0/bin/wso2server.sh start' & 

echo "Checking ESB Server Health"

while true 
do
  RSP="$(curl -sL -w "%{http_code}\\n"  "http://$2:8280/services/Version" -o /dev/null)"
  if [ "$RSP" == 200 ]
  then
      break
  fi
  echo "Server Up"
done

echo "Jmeter script execution goes here!!!"
/home/ubuntu/apache-jmeter-2.11/bin/jmeter -JConcurrency=$3 -JDuration=$4 -JHost=$2 -JService=$5 -JPayload=$6 -n -t ESB_Perf.jmx
echo "Done"
ssh -i chamaraa.pem ubuntu@192.168.48.168 'killall java'
