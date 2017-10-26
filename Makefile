REGISTRY=reponame
IMAGE = infra/gen_pass
TAG = latest

build:
	docker build -t ${REGISTRY}/${IMAGE}:${TAG} .

push: build
	docker push ${REGISTRY}/${IMAGE}:${TAG} 

entropy:
	docker run --name entropy -d ${REGISTRY}/${IMAGE}:${TAG}

pass:
	 docker run -i -t --rm ${REGISTRY}/${IMAGE}:${TAG} /pwtools/format.sh

debug:
	docker run -i -t --rm  --entrypoint=/bin/sh ${REGISTRY}/${IMAGE}:${TAG}