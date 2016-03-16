GIT_COMMIT:=$(shell git rev-parse --short HEAD)

.PHONY: build
build: Dockerfile
	docker build -t spadmann/apollo-workshop .

.PHONY: push
push: build
	docker tag spadmann/apollo-workshop spadmann/apollo-workshop:$(GIT_COMMIT)
	docker push spadmann/apollo-workshop:$(GIT_COMMIT)

.PHONY: deploy
deploy: push
	bin/apollo deploy -e production -m ikman -t $(GIT_COMMIT)

 



