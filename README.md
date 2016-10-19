# artifactory-jmx-beans
Utilize Artifactory JMX beans for monitoring purpose

## Standup docker Artifactory OSS instance

`docker build -t artifactory .`

`docker run -d -p 8080:8081 -p 9010:9010 -t artifactory`

## Connect to Artifactory JMX Remote using [jmxterm](http://wiki.cyclopsgroup.org/jmxterm/download.html)

```
$ java -jar jmxterm-1.0-alpha-4-uber.jar
Welcome to JMX terminal. Type "help" for available commands.
$>open localhost:9010
#Connection to localhost:9010 is opened
$>bye
#bye
$
```

## Script jmxterm commands to get JMX beans attributes

`./artifactory_jmx_beans.sh`
