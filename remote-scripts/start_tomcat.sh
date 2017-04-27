#!/bin/bash
#export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_121
if pgrep -f "tomcat" > /dev/null; then
    echo "Shutting down Tomcat"
    /home/ubuntu/tomcat/apache-tomcat-7.0.29/bin/catalina.sh stop
    sleep 10
fi

#if [[ -f /home/ubuntu/ei/wso2ei-6.0.0/repository/logs/gc.log ]]; then
#    echo "GC Log exists. Moving to /tmp"
#    mv /home/ubuntu/ei/wso2ei-6.0.0/repository/logs/gc.log /tmp/
#fi

echo "Starting Tomcat"
/home/ubuntu/tomcat/apache-tomcat-7.0.29/bin/catalina.sh start
sleep 10
