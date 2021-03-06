FROM  java:8

# 把jar包添加到镜像中
ADD target/springboot-site-0.0.1-SNAPSHOT.jar  /app.jar

COPY jacocoagent.jar /
#COPY org.jacoco.cli-nodeps.jar /
#CMD java -javaagent:org.jacoco.agent-runtime.jar=output=tcpserver,address=0.0.0.0,port=6300 -jar app.jar

# 镜像暴露的端口
EXPOSE 8801
EXPOSE 6300
RUN bash -c 'touch /app.jar'

# 容器启动命令
    #ENTRYPOINT ["java","-jar","/app.jar"]

CMD java -javaagent:jacocoagent.jar=output=tcpserver,address=0.0.0.0,port=6300 -jar app.jar

# 设置时区
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone