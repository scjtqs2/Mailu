#!/bin/bash

DOCKER_ORG=scjtqs
PINNED_MAILU_VERSION=1.9.34
MAILU_VERSION=1.9

docker buildx create --use --name mydevbuilder
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/nginx:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./core/nginx
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/unbound:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./optional/unbound
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/dovecot:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./core/dovecot
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/postfix:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./core/postfix
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/rspamd:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./core/rspamd
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/clamav:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./optional/clamav
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/radicale:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./optional/radicale
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/traefik-certdumper:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./optional/traefik-certdumper
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/admin:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./core/admin
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/roundcube:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./webmails/roundcube
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/rainloop:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./webmails/rainloop
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/fetchmail:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./optional/fetchmail
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/none:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./core/none
docker buildx build --build-arg  pinned_version=${MAILU_VERSION} --build-arg version=${PINNED_MAILU_VERSION}  --tag ${DOCKER_ORG}/docs:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./docs
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/setup:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./setup

docker buildx rm mydevbuilder