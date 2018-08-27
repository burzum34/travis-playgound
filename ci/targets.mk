DKR_REGISTRY:=registry.gitlab.com/forzafootball/images
DKR_BUILD_IMAGE:=$(DKR_REGISTRY)/elixir:1.5.3-alpine
DKR_FILE:=ci/Dockerfile
DKR_IMAGE:=$(DKR_REGISTRY)/travis-playground

DKR_RUN=docker run --rm -it -w /work -v $(shell pwd)/:/work $(DKR_BUILD_IMAGE)

deps: docker-login
	$(DKR_RUN) mix deps.get

compile: docker-login
	$(DKR_RUN) mix deps.compile
	$(DKR_RUN) mix compile --warnings-as-errors

test: docker-login
	$(DKR_RUN) mix test

lint: not-implemented

integration-test: not-implemented

docker-build: docker-login
	docker build -t $(DKR_IMAGE):$$DKR_TAG -f $(DKR_FILE) .

docker-push: docker-login docker-build
	docker push $(DKR_IMAGE):$$DKR_TAG

deploy: not-implemented

docker-login:
	echo "$$DKR_PASSWORD" | docker login -u "$$DKR_USER" --password-stdin $(DKR_REGISTRY)

not-implemented:
	echo "NOT IMPLEMENTED"
