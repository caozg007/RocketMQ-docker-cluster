sed -i "s/brokerip/$brokerIP1/g" broker.properties
sh bin/mqbroker -n $namesrvAddr -c broker.properties &
tail -f /root/logs/rocketmqlogs/broker.log
