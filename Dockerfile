ARG FLUENTD_VERSION=1.3

FROM fluent/fluentd:v${FLUENTD_VERSION}

LABEL maintainer="info@redmic.es"

ARG ES_PLUGIN_VERSION=3.4.0

RUN apk add --update --no-cache --virtual .build-deps \
		build-base \
		ruby-dev && \
	gem install --no-document \
		fluent-plugin-elasticsearch:${ES_PLUGIN_VERSION} && \
	gem sources --clear-all && \
	apk del .build-deps
