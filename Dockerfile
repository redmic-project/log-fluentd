ARG FLUENTD_VERSION=1.11

FROM fluent/fluentd:v${FLUENTD_VERSION}

LABEL maintainer="info@redmic.es"

ARG ES_PLUGIN_VERSION=4.0.9
ARG BUILD_BASE_VERSION=0.5-r1
ARG RUBY_DEV_VERSION=2.5.8-r0

USER root

RUN apk add --update --no-cache \
	--virtual .build-deps \
	build-base=${BUILD_BASE_VERSION} \
	ruby-dev=${RUBY_DEV_VERSION} && \
	gem install --no-document \
	fluent-plugin-elasticsearch:${ES_PLUGIN_VERSION} && \
	gem sources --clear-all && \
	apk del .build-deps

USER fluent
