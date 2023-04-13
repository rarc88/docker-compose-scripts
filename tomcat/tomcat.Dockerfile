FROM    tomcat:8.5-jdk8-openjdk

ENV     DEBIAN_FRONTEND=noninteractive

RUN     apt-get update
RUN     apt-get install -y ant nano

RUN     chmod 777 -R /usr/local/tomcat/webapps