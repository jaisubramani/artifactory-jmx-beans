
#!/bin/bash

JMXTERM=jmxterm-1.0-alpha-4-uber.jar
HOST=localhost
PORT=9010
DOMAIN="org.jfrog.artifactory"

BEANS=$(echo "beans -d ${DOMAIN}" | java -jar ${JMXTERM} -l ${HOST}:${PORT} -n -v silent | cut -f2- -d' ')
IFS=$'\n'
for b in ${BEANS};
do
  echo "[${b}]"
  # attribute name must match with how it is displayed in JConsole so tweak it
  BEAN=$(echo "${b}" | sed 's|instance=Artifactory,||g' | sed 's|type=|instance=Artifactory, type=|g' | sed 's| |\\ |g')
  echo "get -d ${DOMAIN} -b ${BEAN} *" | java -jar ${JMXTERM} -l ${HOST}:${PORT} -n -v silent
done;
