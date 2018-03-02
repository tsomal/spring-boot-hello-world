FROM openjdk:8
ADD target/hello-world.jar hello-world.jar
EXPOSE 8085
ENTRYPOINT ["java","-jar", "hello-world.jar"]