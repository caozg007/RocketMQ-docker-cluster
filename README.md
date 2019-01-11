# RocketMQ-docker-cluster
RocketMQ集群docker安装步骤：

1.下载官方最新的RocketMQ 4.3.2源码包<br>
下载地址：http://rocketmq.apache.org/release_notes/release-notes-4.3.2/

2.git clone本项目到源码包同一文件夹下，执行dockerfile制作broker和nameserver的镜像<br>
注:Dockerfile中的192.168.88.249/library/java:alpine为私服仓库的alpine镜像，可用其他公网对应的或普通的java镜像替换
<br>文件列表说明：<br>
broker-entrypoint.sh为broker镜像的启动命令<br>
nameserver-entrypoint.sh为nameserver镜像的启动命令<br>
broker.properties为broker的配置文件<br>
cluster_run.sh为容器中的集群状态检查命令<br>

3.容器启动命令（ 注：启动脚本中的IP地址请自行替换）<br>
mqbroker_run.sh：broker容器启动<br>
mqnameserver_run.sh：nameserver容器启动<br>
mqconsole_run.sh: MQ控制台容器启动<br>

4.集群启动命令参考<br>
cluster_run.sh<br>
broker配置方法见broker.properties
