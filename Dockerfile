ARG FLUENTD_VERSION=1.3

FROM fluent/fluentd:v${FLUENTD_VERSION}

LABEL maintainer="info@redmic.es"

ARG REWRITE_TAG_PLUGIN_VERSION=2.1.1
ARG ES_PLUGIN_VERSION=2.12.1

RUN apk add --update --no-cache --virtual .build-deps \
		build-base \
		ruby-dev && \
	gem install --no-document \
		fluent-plugin-rewrite-tag-filter:${REWRITE_TAG_PLUGIN_VERSION} \
		fluent-plugin-elasticsearch:${ES_PLUGIN_VERSION} && \
	gem sources --clear-all && \
	apk del .build-deps
