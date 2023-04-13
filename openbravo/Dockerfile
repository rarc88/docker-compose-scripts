FROM    tomcat:8.5-jdk8-openjdk

ENV     DEBIAN_FRONTEND=noninteractive
ENV     TZ=America/Guayaquil
ENV     CATALINA_OPTS='-server -Xms1500M -Xmx3000M'
ENV     JAVA_OPTS='-server -Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom -Xms1500M -Xmx3000M'
ENV     JPDA_TRANSPORT=dt_socket
ENV     JPDA_ADDRESS=8000
ENV     ANT_OPTS='-Xmx1500M'

RUN     apt-get update
RUN     apt-get install -y ant nano zip

RUN     chmod 775 -R /usr/local/tomcat/webapps
RUN     mkdir /usr/local/tomcat/conf/Catalina
RUN     chmod 775 -R /usr/local/tomcat/conf/Catalina

COPY    openbravo-3.0PR18Q3.5.zip /opt
RUN     cd /opt && unzip openbravo-3.0PR18Q3.5.zip && rm openbravo-3.0PR18Q3.5.zip && mv openbravo-3.0PR18Q3.5 openbravo
COPY    openbravo/modules/* /opt/openbravo/modules/
COPY    openbravo/src/* /opt/openbravo/src/
RUN     cd /opt/openbravo && mkdir -p attachments complete_modules partial_modules && chmod 775 -R /opt/openbravo
RUN     mkdir -p /docker-entrypoint-initdb.d/
COPY    init.sh /docker-entrypoint-initdb.d/
RUN     chmod 775 -R /docker-entrypoint-initdb.d/

WORKDIR /opt/openbravo

USER    1000