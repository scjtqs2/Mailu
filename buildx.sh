#!/bin/bash

DOCKER_ORG=scjtqs
PINNED_MAILU_VERSION=1.9.34
MAILU_VERSION=1.9

docker buildx create --use --name mydevbuilder
echo build  ${DOCKER_ORG}/nginx:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/nginx:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./core/nginx
echo build ${DOCKER_ORG}/unbound:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/unbound:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./optional/unbound
echo build ${DOCKER_ORG}/dovecot:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/dovecot:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./core/dovecot
echo build ${DOCKER_ORG}/postfix:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/postfix:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./core/postfix
echo build ${DOCKER_ORG}/rspamd:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/rspamd:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./core/rspamd
echo build ${DOCKER_ORG}/clamav:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/clamav:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./optional/clamav
echo build ${DOCKER_ORG}/radicale:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/radicale:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./optional/radicale
echo build ${DOCKER_ORG}/traefik-certdumper:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/traefik-certdumper:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./optional/traefik-certdumper
echo build ${DOCKER_ORG}/admin:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/admin:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./core/admin
echo build ${DOCKER_ORG}/roundcube:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/roundcube:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./webmails/roundcube
echo build ${DOCKER_ORG}/rainloop:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/rainloop:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./webmails/rainloop
echo build ${DOCKER_ORG}/fetchmail:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/fetchmail:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./optional/fetchmail
echo build ${DOCKER_ORG}/none:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/none:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./core/none
echo build ${DOCKER_ORG}/docs:${PINNED_MAILU_VERSION}
docker buildx build --build-arg  pinned_version=${MAILU_VERSION} --build-arg version=${PINNED_MAILU_VERSION}  --tag ${DOCKER_ORG}/docs:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./docs
echo build ${DOCKER_ORG}/setup:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/setup:${PINNED_MAILU_VERSION}  --platform linux/amd64,linux/arm64  --push ./setup

docker buildx rm mydevbuilder