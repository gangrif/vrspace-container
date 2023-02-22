# Basing this on the RHEL UBI
FROM registry.access.redhat.com/ubi8/ubi

# Volumes
#VOLUME /config
#VOLUME /worlds

# Install some dependencies
RUN dnf -y install curl git java-11-openjdk

# Let's clone the public source for vrspace
WORKDIR /app
RUN git clone https://github.com/jalmasi/vrspace.git
RUN mkdir /config
RUN cp /app/vrspace/server/src/main/resources/application.properties /config/application.properties 

# Now let's build it with Maven
WORKDIR /app/vrspace/server/target/
#RUN JAVA_HOME=/usr/lib/jvm/jre-11/ mvn clean install -DskipTests
#RUN JAVA_HOME=/usr/lib/jvm/jre-11/ mvn clean install
RUN curl -o server-0.5.0-SNAPSHOT.jar https://s01.oss.sonatype.org/content/repositories/snapshots/org/vrspace/server/0.5.0-SNAPSHOT/server-0.5.0-20230209.155703-1.jar 

# The default port that the vrspace server listens on
EXPOSE 8080

# And we run vrspace.  
# This line could use some work, as the server-###-SNAPSHOT.jar file will change if the version of vrspace that's cloned changes.
CMD ["/usr/lib/jvm/jre-11/bin/java", "-jar", "/app/vrspace/server/target/server-0.5.0-SNAPSHOT.jar", "--spring.config.location=/config/application.properties"]
