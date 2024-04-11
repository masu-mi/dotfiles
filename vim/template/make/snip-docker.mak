# to make container image
# currently for manual opeartion
# Usage:
#   [VERSION=v3] [REGISTRY="gcr.io"] make build
VERSION?=develop
REGISTRY?={{_input_:host_path}}
IMAGE_NAME?={{_input_:container_image}}
DOCKERFILE?=Dockerfile

release: clean build push

# builds a docker image that builds the app and packages it into a minimal docker image
build:
	docker build \
		-t ${REGISTRY}/${IMAGE_NAME}:${VERSION} \
		-f ${DOCKERFILE} \
		.

# push the image to an registry
push:
	gcloud docker -- push ${REGISTRY}/${IMAGE_NAME}:${VERSION}

# remove previous images and containers
clean:
	docker rm -f ${REGISTRY}/${IMAGE_NAME}:${VERSION} 2> /dev/null || true

.PHONY: release clean build push
