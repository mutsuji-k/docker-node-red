IMAGE_NAME=rcarmo/node-red
DATA_FOLDER?=/srv/node-red/data
MODULES_FOLDER=node_modules
HOSTNAME?=node-red
TAG?=alpine-armhf
alpine: alpine/Dockerfile
	docker build -t $(IMAGE_NAME):alpine-armhf alpine

alpine.x86_64: alpine.x86_64/Dockerfile
	docker build -t $(IMAGE_NAME):alpine alpine.x86_64
	docker tag $(IMAGE_NAME):alpine $(IMAGE_NAME):latest

jessie: jessie/Dockerfile
	docker build -t $(IMAGE_NAME):jessie-armhf jessie

push:
	docker push $(IMAGE_NAME)

network:
	-docker network create -d macvlan \
	--subnet=192.168.1.0/24 \
        --gateway=192.168.1.254 \
	--ip-range=192.168.1.128/25 \
	-o parent=eth0 \
	lan

shell:
	docker run --net=lan -h $(HOSTNAME) -it $(IMAGE_NAME):$(TAG) /bin/sh

test: 
	-mkdir -p $(DATA_FOLDER)
	docker run -v $(DATA_FOLDER):/home/user/.node-red \
		--net=host -h $(HOSTNAME) $(IMAGE_NAME):$(TAG)

daemon: network
	-mkdir -p $(DATA_FOLDER)
	docker run -v $(DATA_FOLDER):/home/user/.node-red \
		--net=lan -h $(HOSTNAME) -d --restart unless-stopped $(IMAGE_NAME):$(TAG)

clean:
	-docker rm -v $$(docker ps -a -q -f status=exited)
	-docker rmi $$(docker images -q -f dangling=true)
	-docker rmi $(IMAGE_NAME)
