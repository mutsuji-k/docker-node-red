export ARCH?=$(shell arch)
ifneq (,$(findstring armv6,$(ARCH)))
export BASE=arm32v6/ubuntu:18.04
export ARCH=arm32v6
else ifneq (,$(findstring armv7,$(ARCH)))
export BASE=arm32v7/ubuntu:18.04
export ARCH=arm32v7
else
export BASE=ubuntu:18.04
export ARCH=amd64
endif
export IMAGE_NAME=rcarmo/node-red
export HOSTNAME?=node-red
export DATA_FOLDER=$(HOME)/.node-red
export VCS_REF=`git rev-parse --short HEAD`
export VCS_URL=https://github.com/rcarmo/docker-node-red
export BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"`
export TAG_DATE=`date -u +"%Y%m%d"`

tag:
	docker tag $(IMAGE_NAME):$(ARCH) $(IMAGE_NAME):$(ARCH)-$(TAG_DATE)

build: Dockerfile
	docker build --build-arg BUILD_DATE=$(BUILD_DATE) \
		--build-arg VCS_REF=$(VCS_REF) \
		--build-arg VCS_URL=$(VCS_URL) \
		--build-arg ARCH=$(ARCH) \
		--build-arg BASE=$(BASE) \
		-t $(IMAGE_NAME):$(ARCH) .

push:
	docker push $(IMAGE_NAME)
	docker push $(IMAGE_NAME):$(ARCH)-$(TAG_DATE)

shell:
	docker run --net=lan -h $(HOSTNAME) -it $(IMAGE_NAME):$(ARCH) /bin/sh

test: 
	docker run -v $(DATA_FOLDER):/home/user/.node-red \
		--net=host --name $(HOSTNAME) $(IMAGE_NAME):$(ARCH)

update:
	-docker pull $(IMAGE_NAME):$(ARCH)
	-docker stop $(HOSTNAME)
	-docker rm $(HOSTNAME)
	make daemon

daemon: 
	-mkdir -p $(DATA_FOLDER)
	docker run -v $(DATA_FOLDER):/home/user/.node-red \
		-v /var/run/dbus:/var/run/dbus \
		--net=host --name $(HOSTNAME) -d --restart unless-stopped $(IMAGE_NAME):$(ARCH)

clean:
	-docker rm -v $$(docker ps -a -q -f status=exited)
	-docker rmi $$(docker images -q -f dangling=true)
	-docker rmi $$(docker images --format '{{.Repository}}:{{.Tag}}' | grep '$(IMAGE_NAME)')
