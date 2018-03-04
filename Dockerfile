FROM alpine:edge

MAINTAINER damir <iscode@qq.com>
ARG AriaNg=0.4.0
RUN apk update \
	&& apk add --no-cache --update bash aria2 darkhttpd \
	&& mkdir -p /conf \
	&& mkdir -p /conf-copy \
	&& mkdir -p /aria2-ng 

RUN apk add --no-cache --virtual .build-deps unzip curl && cd /tmp \
    && curl -fSL https://github.com/mayswind/AriaNg/releases/download/${AriaNg}/aria-ng-${AriaNg}.zip -o aria2-ng.zip \
    && unzip aria2-ng.zip -d /aria2-ng\
	&& rm -rf aria2-ng.zip \
    && apk del .build-deps
RUN addgroup -g 1000 download&&adduser -G $GROUPNAME -S -u 1000 download

ADD start.sh /conf-copy/start.sh
ADD aria2.conf /conf-copy/aria2.conf

RUN chmod +x /conf-copy/start.sh

WORKDIR /
VOLUME ["/conf"]
EXPOSE 6800
EXPOSE 80

USER download

CMD ["/conf-copy/start.sh"]