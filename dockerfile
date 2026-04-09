FROM openjdk:27-ea-trixie

ADD target/springboot-app.jar springboot-app.jar

ENTRYPOINT ["java", "-jar", "/springboot-app.jar"]
