#!/bin/bash

DOCKER_ORG=scjtqs
PINNED_MAILU_VERSION=1.9.26
MAILU_VERSION=1.9

docker buildx create --use --name mydevbuilder
echo build  ${DOCKER_ORG}/mailu-nginx:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/mailu-nginx:${PINNED_MAILU_VERSION}  --platform linux/arm64  --push ./core/nginx
echo build ${DOCKER_ORG}/mailu-unbound:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/mailu-unbound:${PINNED_MAILU_VERSION}  --platform linux/arm64  --push ./optional/unbound
echo build ${DOCKER_ORG}/mailu-dovecot:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/mailu-dovecot:${PINNED_MAILU_VERSION}  --platform linux/arm64  --push ./core/dovecot
echo build ${DOCKER_ORG}/mailu-postfix:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/mailu-postfix:${PINNED_MAILU_VERSION}  --platform linux/arm64  --push ./core/postfix
echo build ${DOCKER_ORG}/mailu-rspamd:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/mailu-rspamd:${PINNED_MAILU_VERSION}  --platform linux/arm64  --push ./core/rspamd
echo build ${DOCKER_ORG}/mailu-clamav:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/mailu-clamav:${PINNED_MAILU_VERSION}  --platform linux/arm64  --push ./optional/clamav
echo build ${DOCKER_ORG}/mailu-radicale:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/mailu-radicale:${PINNED_MAILU_VERSION}  --platform linux/arm64  --push ./optional/radicale
echo build ${DOCKER_ORG}/mailu-traefik-certdumper:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/mailu-traefik-certdumper:${PINNED_MAILU_VERSION}  --platform linux/arm64  --push ./optional/traefik-certdumper
echo build ${DOCKER_ORG}/mailu-admin:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/mailu-admin:${PINNED_MAILU_VERSION}  --platform linux/arm64  --push ./core/admin
echo build ${DOCKER_ORG}/mailu-roundcube:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/mailu-roundcube:${PINNED_MAILU_VERSION}  --platform linux/arm64  --push ./webmails/roundcube
echo build ${DOCKER_ORG}/mailu-rainloop:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/mailu-rainloop:${PINNED_MAILU_VERSION}  --platform linux/arm64  --push ./webmails/rainloop
echo build ${DOCKER_ORG}/mailu-fetchmail:${PINNED_MAILU_VERSION}
docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/mailu-fetchmail:${PINNED_MAILU_VERSION}  --platform linux/arm64  --push ./optional/fetchmail
#echo build ${DOCKER_ORG}/mailu-none:${PINNED_MAILU_VERSION}
#docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/mailu-none:${PINNED_MAILU_VERSION}  --platform linux/arm64  --push ./core/none
#echo build ${DOCKER_ORG}/mailu-docs:${PINNED_MAILU_VERSION}
#docker buildx build --build-arg  pinned_version=${MAILU_VERSION} --build-arg version=${PINNED_MAILU_VERSION}  --tag ${DOCKER_ORG}/mailu-docs:${PINNED_MAILU_VERSION}  --platform linux/arm64  --push ./docs
#echo build ${DOCKER_ORG}/mailu-setup:${PINNED_MAILU_VERSION}
#docker buildx build --build-arg VERSION=${PINNED_MAILU_VERSION} --tag ${DOCKER_ORG}/mailu-setup:${PINNED_MAILU_VERSION}  --platform linux/arm64  --push ./setup

docker buildx rm mydevbuilder