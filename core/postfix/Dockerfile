ARG DISTRO=alpine:3.14.5

FROM $DISTRO
ARG VERSION

ENV TZ Etc/UTC

LABEL version=$VERSION

# python3 shared with most images
RUN apk add --no-cache \
    python3 py3-pip git bash py3-multidict py3-yarl tzdata \
  && pip3 install --upgrade pip

# Shared layer between nginx, dovecot, postfix, postgresql, rspamd, unbound, snappymail, roundcube
RUN pip3 install socrate==0.2.0

# Shared layer between dovecot and postfix
RUN apk add --no-cache --virtual .build-deps gcc musl-dev python3-dev \
  && pip3 install "podop>0.2.5" \
  && apk del .build-deps

# Image specific layers under this line
# Building pycares from source requires py3-wheel and libffi-dev packages
RUN pip install --no-cache-dir --extra-index-url=https://www.piwheels.org/simple --only-binary=:all: postfix-mta-sts-resolver==1.0.1 || (apk add --no-cache --virtual .build-deps gcc musl-dev python3-dev py3-wheel libffi-dev \
  && pip3 install postfix-mta-sts-resolver==1.0.1 \
  && apk del .build-deps )

RUN apk add --no-cache postfix postfix-pcre cyrus-sasl-login rsyslog logrotate

COPY conf /conf
COPY start.py /start.py

EXPOSE 25/tcp 10025/tcp
VOLUME ["/queue"]

CMD /start.py

HEALTHCHECK --start-period=350s CMD echo QUIT|nc localhost 25|grep "220 .* ESMTP Postfix"
RUN echo $VERSION >> /version
