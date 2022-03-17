FROM registry.access.redhat.com/ubi8/ubi
RUN dnf -y install maven git java-11-openjdk
WORKDIR /app
RUN git clone https://github.com/jalmasi/vrspace.git
WORKDIR /app/vrspace
RUN JAVA_HOME=/usr/lib/jvm/jre-11/ mvn clean install -DskipTests
EXPOSE 8080
CMD ["/usr/lib/jvm/jre-11/bin/java", "-jar", "/app/vrspace/server/target/server-0.4.5-SNAPSHOT.jar"]
