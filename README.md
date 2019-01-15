### RocketMQ集群 Docker安装步骤：

1.下载官方最新的RocketMQ 4.3.2源码包<br>
下载地址：http://rocketmq.apache.org/release_notes/release-notes-4.3.2/

2.git clone本项目到源码包同一文件夹下，使用dockerfile制作broker和nameserver的镜像<br>
<br>文件列表说明：<br>
broker-entrypoint.sh为broker镜像的启动命令<br>
nameserver-entrypoint.sh为nameserver镜像的启动命令<br>
broker.properties为broker的配置文件<br>
clusterlist.sh为容器中的集群状态检查脚本<br>

3.容器启动命令（ 注：启动脚本中的IP地址请自行替换）<br>
mqbroker_run.sh：broker容器启动<br>
mqnameserver_run.sh：nameserver容器启动<br>
mqconsole_run.sh: MQ控制台容器启动<br>

4.集群启动命令参考<br>
cluster_run.sh<br>
broker配置方法见broker.properties

5.MQ管理控制台安装
mqconsole.sh









-------------------------------------------------------------------------------------------------------
附：RocketMQ 组件升级最新版本步骤：

1.下载官方最新版本源码
2.执行mvn -Prelease-all -DskipTests clean install -U编译
3.去除JVM版本警告
cd /root/rocketmq_alpine_4.3/bin 下 执行grep -rn "PermSize" .  删除相关永久代配置

4.制作Dockerfile镜像：
```
docker build -t broker:4.3-alpine .
docker build -t namesrv:4.3-alpine .
```

5.镜像打标签：
```
docker tag namesrv:4.3-alpine 192.168.*.*/library/namesrv:4.3-alpine
docker tag broker:4.3-alpine 192.168.*.*/library/broker:4.3-alpine
```

6.推送到Harbor私服
```
docker push 192.168.*.*/library/namesrv:4.3-alpine
docker push 192.168.*.*/library/broker:4.3-alpine
```

7.登录需要重新部署的服务器，删除原broker,nameserver容器
平滑升级步骤，先更新第一组的slave，再更新第一组的master，再更新第二组的slave，再更新第二组的master顺序，确保应用不中断

8.获取私服镜像：
```
docker pull 192.168.*.*/library/broker:4.3-alpine
docker pull 192.168.*.*/library/namesrv:4.3-alpine
```

9.容器启动脚本不变

11.检查mq集群或单机状态：
进入容器运行：sh clusterlist.sh查看broker版本
或登录WEB管理控制台查看broker版本 
