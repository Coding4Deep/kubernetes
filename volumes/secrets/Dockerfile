FROM maven AS build
RUN apt-get update && apt-get install -y curl git
RUN git clone -b main  https://github.com/Coding4Deep/Nodejs-Java-CI-CD.git
WORKDIR /Nodejs-Java-CI-CD
RUN mvn clean package 

FROM tomcat
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build /Nodejs-Java-CI-CD/target/k8s.war /usr/local/tomcat/webapps/ROOT.war
CMD ["catalina.sh", "run"]