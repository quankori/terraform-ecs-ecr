- build:
	DOCKER_BUILDKIT=0 docker build -t golang_image_test .
- run:
	docker run --name test_local -p 9000:8080 golang_image_test