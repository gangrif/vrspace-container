# Basing this on the RHEL UBI
FROM registry.access.redhat.com/ubi8/ubi

# Volumes
#VOLUME /config
#VOLUME /worlds

# Install some dependencies
RUN dnf -y install maven git java-11-openjdk

# Let's clone the public source for vrspace
WORKDIR /app
RUN git clone https://github.com/jalmasi/vrspace.git

RUN cp /app/vrspace/server/src/main/resources/application.properties /config 

# Now let's build it with Maven
WORKDIR /app/vrspace
#RUN JAVA_HOME=/usr/lib/jvm/jre-11/ mvn clean install -DskipTests
RUN JAVA_HOME=/usr/lib/jvm/jre-11/ mvn clean install

# The default port that the vrspace server listens on
EXPOSE 8080

# And we run vrspace.  
# This line could use some work, as the server-###-SNAPSHOT.jar file will change if the version of vrspace that's cloned changes.
#CMD ["/usr/lib/jvm/jre-11/bin/java", "-jar", "/app/vrspace/server/target/server-0.4.7-SNAPSHOT.jar", "--spring.config.location=/application.properties"]
CMD ["/usr/lib/jvm/jre-11/bin/java", "-jar", "/app/vrspace/server/target/server-0.4.7-SNAPSHOT.jar"]
