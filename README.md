# esb-perf
An automated script framework for performance testing WSO2 ESB using Jmeter

Execution command: 
./esb-perf-execution.sh remote-tomcat-ip remote-wso2ei-ip concurrency timelimit service payload

Ex:- 
./esb-perf-execution.sh 192.168.48.168 192.168.48.168 80 300 DirectProxy 5K_buyStocks.xml
