SHELL = /bin/bash

clean:
	./gradlew clean

assemble:
	./gradlew assemble

run: assemble
	java -jar build/libs/spring-boot-versioning-demo-*.jar

docker-image: assemble
	version=$$(./gradlew getArtifactVersion --quiet); \
	docker build . -t spring-boot-versioning-demo:$$version --build-arg VERSION=$$version

docker-run: docker-image
	version=$$(./gradlew getArtifactVersion --quiet); \
	docker run --rm spring-boot-versioning-demo:$$version
