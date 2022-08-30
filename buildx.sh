#!/bin/bash

DOCKER_ORG=scjtqs
DOCKER_PREFIX=${DOCKER_PREFIX:-}
PINNED_MAILU_VERSION=1.9.26
MAILU_VERSION=1.9

docker buildx create --use --name mydevbuilder
echo build  ${DOCKER_ORG}/${DOCKER_PREFIX:-}nginx:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/${DOCKER_PREFIX:-}nginx:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./core/nginx
echo build ${DOCKER_ORG}/${DOCKER_PREFIX:-}unbound:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/${DOCKER_PREFIX:-}unbound:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./optional/unbound
echo build ${DOCKER_ORG}/${DOCKER_PREFIX:-}dovecot:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/${DOCKER_PREFIX:-}dovecot:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./core/dovecot
echo build ${DOCKER_ORG}/${DOCKER_PREFIX:-}postfix:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/${DOCKER_PREFIX:-}postfix:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./core/postfix
echo build ${DOCKER_ORG}/${DOCKER_PREFIX:-}rspamd:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/${DOCKER_PREFIX:-}rspamd:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./core/rspamd
echo build ${DOCKER_ORG}/${DOCKER_PREFIX:-}clamav:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/${DOCKER_PREFIX:-}clamav:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./optional/clamav
echo build ${DOCKER_ORG}/${DOCKER_PREFIX:-}radicale:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/${DOCKER_PREFIX:-}radicale:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./optional/radicale
echo build ${DOCKER_ORG}/${DOCKER_PREFIX:-}traefik-certdumper:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/${DOCKER_PREFIX:-}traefik-certdumper:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./optional/traefik-certdumper
echo build ${DOCKER_ORG}/${DOCKER_PREFIX:-}admin:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/${DOCKER_PREFIX:-}admin:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./core/admin
echo build ${DOCKER_ORG}/${DOCKER_PREFIX:-}roundcube:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/${DOCKER_PREFIX:-}roundcube:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./webmails/roundcube
echo build ${DOCKER_ORG}/${DOCKER_PREFIX:-}rainloop:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/${DOCKER_PREFIX:-}rainloop:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./webmails/rainloop
echo build ${DOCKER_ORG}/${DOCKER_PREFIX:-}fetchmail:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/${DOCKER_PREFIX:-}fetchmail:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./optional/fetchmail
echo build ${DOCKER_ORG}/${DOCKER_PREFIX:-}none:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/${DOCKER_PREFIX:-}none:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./core/none
echo build ${DOCKER_ORG}/${DOCKER_PREFIX:-}docs:${PINNED_MAILU_VERSION}
docker buildx build --build-arg  pinned_version=${MAILU_VERSION} --build-arg version=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/${DOCKER_PREFIX:-}docs:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./docs
echo build ${DOCKER_ORG}/${DOCKER_PREFIX:-}setup:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/${DOCKER_PREFIX:-}setup:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./setup

docker buildx rm mydevbuilder