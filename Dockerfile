FROM ubuntu:latest

#To organize the docker image
LABEL org.opencontainers.image.source https://github.com/tlxian/test

#set work directory
WORKDIR /opt

#update the package list 
RUN	   apt-get update \

#install git	
	&& apt-get install -y git \

#install maven without question
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y maven \

#scm checkout

	&& git clone https://github.com/akeic/test01.git \

#clear directory and build project as jar file
	
	&& mvn -f ./test01/pom.xml clean package 

#Run jar file	
CMD ["java","-jar","./test01/target/demo-0.0.1-SNAPSHOT.jar"]




