DKR_REGISTRY:=registry.gitlab.com/forzafootball/images
DKR_BUILD_IMAGE:=$(DKR_REGISTRY)/elixir:1.5.3-alpine

DKR=docker run --rm -it -w /work -v $(shell pwd)/:/work $(DKR_BUILD_IMAGE)

deps: docker-login
	$(DKR) echo "NOT IMPLEMENTED"

compile: docker-login
	$(DKR) echo "NOT IMPLEMENTED"

test: docker-login
	$(DKR) echo "NOT IMPLEMENTED"

lint: docker-login
	$(DKR) echo "NOT IMPLEMENTED"

docker-login:
	echo "$$DKR_PASSWORD" | docker login -u "$$DKR_USER" --password-stdin $(DKR_REGISTRY)