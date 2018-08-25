DKR_REGISTRY := registry.gitlab.com/forzafootball/images
DKR_BUILD_IMAGE := $(DKR_REGISTRY)/elixir:1.5.3-alpine

deps: docker-login
	echo "deps"

compile: docker-login
	echo "compile"

test: docker-login
	echo "test"

lint: docker-login
	echo "lint"

docker-login:
	echo "$$DKR_PASSWORD" | docker login -u "$$DKR_USER" --password-stdin $(DKR_REGISTRY)