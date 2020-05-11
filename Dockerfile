ARG FLUENTD_VERSION=1.3

FROM fluent/fluentd:v${FLUENTD_VERSION}

LABEL maintainer="info@redmic.es"

ARG ES_PLUGIN_VERSION=3.5.0

RUN apk add --update --no-cache \
	--virtual .build-deps \
	build-base=0.5-r1 \
	ruby-dev=2.5.8-r0 && \
	gem install --no-document \
	fluent-plugin-elasticsearch:${ES_PLUGIN_VERSION} && \
	gem sources --clear-all && \
	apk del .build-deps
