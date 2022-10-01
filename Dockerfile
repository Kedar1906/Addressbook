FROM tomcat:8

maintainer

COPY ./addressbook.war /usr/local/tomcat/webapps

