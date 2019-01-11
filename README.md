# RocketMQ-docker-cluster
RocketMQ集群docker安装步骤：

1.下载官方最新的RocketMQ 4.3安装包

2.执行dockerfile制作broker和nameserver的镜像
注Dockerfile中的192.168.88.249/library/java:alpine为私服仓库的alpine镜像，可用其他公网对应的或普通的java镜像替换
文件列表说明：
broker-entrypoint.sh为broker镜像的启动命令
nameserver-entrypoint.sh为nameserver镜像的启动命令
broker.properties为broker的配置文件
cluster_run.sh为容器中的集群状态检查命令

3.容器启动命令（ 注：启动脚本中的IP地址请自行替换）
mqbroker_run.sh：broker容器启动
mqnameserver_run.sh：nameserver容器启动
mqconsole_run.sh: MQ控制台容器启动

4.集群启动命令参考
cluster_run.sh
