# demo-springboot-issue

Demo project to reproduce the client authentication issue in Spring boot 2.1.6.RELEASE
when embedded Jetty is used.

## To reproduce the issue

1\.  Generate keys/certs required for SSL

```
(cd ./src/main/scripts/ && ./gen_certs.sh)
```

2\.  Build the project
 
```
./mvnw clean install
```

3\.  Run the demo application

```
java -jar target/demo-0.0.1-SNAPSHOT.jar
```

4\.  Use curl to send request to server on a different tab.

```
(cd src/main/scripts/ && ./send_req.sh)
```