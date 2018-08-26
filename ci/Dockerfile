#
# Create build image
#

FROM registry.gitlab.com/forzafootball/images/elixir:1.5.3-alpine as build

COPY . /app

#
# Build app
#

ENV MIX_ENV=prod

WORKDIR /app

RUN mix deps.clean --all && \
  mix deps.get && \
  mix deps.compile && \
  mix clean && \
  mix compile && \
  mix release --verbose

#
# Create release image
#

FROM alpine:3.8

ARG APP_NAME=travis_playground

ENV REPLACE_OS_VARS=true

RUN apk add --update bash openssl && \
  mkdir /app && chown -R nobody: /app

WORKDIR /app
USER nobody

COPY --from=build /app/_build/prod/rel/${APP_NAME}/releases/*/${APP_NAME}.tar.gz .
COPY ./ci/docker-entrypoint.sh /entrypoint.sh

RUN tar xf ${APP_NAME}.tar.gz && \
  rm -f ${APP_NAME}.tar.gz

ENTRYPOINT ["/entrypoint.sh"]
