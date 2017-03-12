IMAGE_NAME=rcarmo/node-red:armhf
DATA_FOLDER?=/srv/node-red/data
HOSTNAME?=node-red
build: Dockerfile
	docker build -t $(IMAGE_NAME) .

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
	docker run --net=lan -h $(HOSTNAME) -it $(IMAGE_NAME) /bin/sh

test: network
	-mkdir -p $(DATA_FOLDER)
	docker run -v $(DATA_FOLDER):/home/user/.node-red \
		--net=lan -h $(HOSTNAME) $(IMAGE_NAME)

daemon: network
	-mkdir -p $(DATA_FOLDER)
	docker run -v $(DATA_FOLDER):/home/user/.node-red \
		--net=lan -h $(HOSTNAME) -d --restart unless-stopped $(IMAGE_NAME)

clean:
	-docker rm -v $$(docker ps -a -q -f status=exited)
	-docker rmi $$(docker images -q -f dangling=true)-docker rmi $(IMAGE_NAME)
