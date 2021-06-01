# stage 1 just for build java project into .war file s
FROM oraclelinux:8.3  as Builder  
MAINTAINER ashutoshh@linux.com
RUN dnf install java-1.8.0-openjdk.x86_64 -y
# JDK installing 
RUN dnf  install maven -y
# maven in an build automation tool for java project
RUN mkdir  /myjavawebapp
WORKDIR  /myjavawebapp 
# to change directory during image build time permanently
COPY  .  . 
# first . all source data  
RUN mvn clean package 
# for automated building of java project 
# as an output we get .war file as entire code 

# stage 2 copy .war into tomcat 
FROM tomcat
MAINTAINER ashutoshh@.linux.com , 9509957594
RUN mkdir  /webcode 
COPY --from=Builder  /myjavawebapp   /webcode
RUN cp -rf  /webcode/target/WebApp.war  /usr/local/tomcat/webapps/
RUN  rm -rf /webcode/* 
EXPOSE 8080
# from above stage we are only copying data 
# /myjavawbeapp  to  /webcode in new image 
