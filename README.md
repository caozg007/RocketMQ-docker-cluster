# RocketMQ-docker-cluster
RocketMQ集群docker安装步骤：

1.执行dockerfile制作broker和nameserver的镜像
文件列表说明：
broker-entrypoint.sh为broker镜像的启动命令
nameserver-entrypoint.sh为nameserver镜像的启动命令
broker.properties为broker的配置文件
cluster_run.sh为容器中的集群状态检查命令
mqbroker_run.sh：broker容器启动命令
mqnameserver_run.sh：nameserver容器启动命令
mqconsole_run.sh: MQ控制台容器启动命令
 注：启动脚本中的IP地址请自行替换

