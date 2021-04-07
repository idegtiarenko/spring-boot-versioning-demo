SHELL = /bin/bash

assemble:
	./gradlew assemble

run: assemble
	java -jar -Dspring.profiles.active=local build/libs/spring-boot-versioning-demo-*.jar

