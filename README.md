# Java Quickstart

Minimal Java project template using Maven.

## Requirements
- Java 21+
- Git

## Build
./mvnw package

## Run
java -jar target/java-quickstart-1.0-SNAPSHOT.jar

## Debug (CLI)
Terminal 1:
`.\mvnw.cmd -Pdebug compile exec:exec`

Terminal 2:
`jdb -connect com.sun.jdi.SocketAttach:hostname=localhost,port=5005`