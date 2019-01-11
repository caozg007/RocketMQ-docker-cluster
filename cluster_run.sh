docker run -d  --name broker_a_master  --net host --restart always -v /etc/localtime:/etc/localtime:ro -v /etc/hosts:/etc/hosts:ro -e namesrvAddr="192.168.88.247:9876;192.168.88.250:9876" -e brokerIP1="192.168.88.247" -h broker_a_master 192.168.88.249/library/broker:4.3-alpine

docker run -d  --name broker_b_slave  --net host --restart always -v /etc/localtime:/etc/localtime:ro -v /etc/hosts:/etc/hosts:ro -e namesrvAddr="192.168.88.247:9876;192.168.88.250:9876" -e brokerIP1="192.168.88.247" -h broker_b_slave 192.168.88.249/library/broker:4.3-alpine

docker run -d  --name broker_b_master  --net host --restart always -v /etc/localtime:/etc/localtime:ro -v /etc/hosts:/etc/hosts:ro -e namesrvAddr="192.168.88.247:9876;192.168.88.250:9876" -e brokerIP1="192.168.88.250" -h broker_b_master 192.168.88.249/library/broker:4.3-alpine

docker run -d  --name broker_a_slave  --net host --restart always -v /etc/localtime:/etc/localtime:ro -v /etc/hosts:/etc/hosts:ro -e namesrvAddr="192.168.88.247:9876;192.168.88.250:9876" -e brokerIP1="192.168.88.250" -h broker_a_slave 192.168.88.249/library/broker:4.3-alpine
