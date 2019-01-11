注：192.168.88.249/library/namesrv:4.3-alpine 修改为Dockerfile制作的nameserver镜像ID或镜像名，
   192.168.88.249/library/broker:4.3-alpine 修改为Dockerfile制作的nameserver镜像ID或镜像名

Nameserver启动：
在192.168.88.247和192.168.88.250上各启动一个nameserver

docker run -d  --name nameserver  --net host  --restart always  -v /etc/localtime:/etc/localtime:ro -v /etc/hosts:/etc/hosts:ro -h nameserver 192.168.88.249/library/namesrv:4.3-alpine


Broker启动：
需在每个容器中修改broker.properties配置文件

在192.168.88.247上启动broker_a_master：
docker run -d  --name broker_a_master  --net host --restart always -v /etc/localtime:/etc/localtime:ro -v /etc/hosts:/etc/hosts:ro -e namesrvAddr="192.168.88.247:9876;192.168.88.250:9876" -e brokerIP1="192.168.88.247" -h broker_a_master 192.168.88.249/library/broker:4.3-alpine

在192.168.88.247上启动broker_b_slave：
docker run -d  --name broker_b_slave  --net host --restart always -v /etc/localtime:/etc/localtime:ro -v /etc/hosts:/etc/hosts:ro -e namesrvAddr="192.168.88.247:9876;192.168.88.250:9876" -e brokerIP1="192.168.88.247" -h broker_b_slave 192.168.88.249/library/broker:4.3-alpine

在192.168.88.250上启动broker_b_master：
docker run -d  --name broker_b_master  --net host --restart always -v /etc/localtime:/etc/localtime:ro -v /etc/hosts:/etc/hosts:ro -e namesrvAddr="192.168.88.247:9876;192.168.88.250:9876" -e brokerIP1="192.168.88.250" -h broker_b_master 192.168.88.249/library/broker:4.3-alpine

在192.168.88.250上启动broker_a_slave：
docker run -d  --name broker_a_slave  --net host --restart always -v /etc/localtime:/etc/localtime:ro -v /etc/hosts:/etc/hosts:ro -e namesrvAddr="192.168.88.247:9876;192.168.88.250:9876" -e brokerIP1="192.168.88.250" -h broker_a_slave 192.168.88.249/library/broker:4.3-alpine
