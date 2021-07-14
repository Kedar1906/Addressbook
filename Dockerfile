FROM tomcat:8

maintainer "kedar"

COPY ./addressbook.war /usr/local/tomcat/webapps

