FROM    tomcat:9-jdk11-openjdk

ENV     DEBIAN_FRONTEND=noninteractive

RUN     apt-get update
RUN     apt-get install -y ant nano git zip

RUN     mkdir /usr/local/tomcat/conf/Catalina
RUN     chmod 777 -R /usr/local/tomcat/webapps

RUN     cd /tmp \
    && git clone https://github.com/etendosoftware/etendo_core.git \
    && mv etendo_core /opt/etendo

RUN     chmod 777 -R /opt/etendo

RUN     cd /opt/etendo \
    && cp gradle.properties.template gradle.properties \
    && echo 'bbdd.host=postgres-etendo' >> gradle.properties

USER    1000

RUN     cd /opt/etendo \
    && ./gradlew setup