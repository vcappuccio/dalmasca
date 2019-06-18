DOCKER_IMG = packetferret/dalmasca
DOCKER_TAG = 0.0.1

build:
	docker build -t $(DOCKER_IMG):$(DOCKER_TAG) .

run:
	docker run -it \
	-v $(pwd):/home/tmp/files \
	-w /home/tmp/files \
	$(DOCKER_IMG):$(DOCKER_TAG) /usr/bin/zsh
