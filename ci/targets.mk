DKR_REGISTRY:=registry.gitlab.com/forzafootball/images
DKR_BUILD_IMAGE:=$(DKR_REGISTRY)/elixir:1.5.3-alpine
DKR_FILE:=ci/Dockerfile
DKR_IMAGE:=$(DKR_REGISTRY)/travis-playground

DKR=docker run --rm -it -w /work -v $(shell pwd)/:/work $(DKR_BUILD_IMAGE)

deps: docker-login
	$(DKR) mix deps.get

compile: docker-login
	$(DKR) mix deps.compile
	$(DKR) mix compile --warnings-as-errors

test: docker-login
	$(DKR) mix test

lint: docker-login
	$(DKR) echo "NOT IMPLEMENTED"

docker-login:
	echo "$$DKR_PASSWORD" | docker login -u "$$DKR_USER" --password-stdin $(DKR_REGISTRY)

docker-build: docker-login
	docker build -t $(DKR_IMAGE):$$DKR_TAG -f $(DKR_FILE) .

docker-push: docker-login docker-build
	docker push
