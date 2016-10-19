FROM docker.bintray.io/jfrog/artifactory-oss:latest
# enable JMX remote management using JAVA_OPTIONS
#   - <java.rmi.server.hostname> must be set to host ip or loopback if you are running JMX inside Docker
#   - set <com.sun.management.jmxremote.rmi.port> value to match <com.sun.management.jmxremote.port> to expose single port in Docker
#   - turn on JMX authenticate and ssl settings for production use
RUN echo 'export JAVA_OPTIONS="-Dcom.sun.management.jmxremote= -Djava.rmi.server.hostname=127.0.0.1 -Dcom.sun.management.jmxremote.port=9010 -Dcom.sun.management.jmxremote.rmi.port=9010 -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false"' >> /var/opt/jfrog/artifactory/etc/default
EXPOSE 9010
