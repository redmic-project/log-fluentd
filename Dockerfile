ARG FLUENTD_VERSION=1.3

FROM fluent/fluentd:v${FLUENTD_VERSION}

LABEL maintainer="info@redmic.es"

ARG ES_PLUGIN_VERSION=2.12.1

RUN apk add --update --virtual .build-deps \
	sudo build-base ruby-dev && \
	sudo gem install \
		fluent-plugin-elasticsearch --no-rdoc --no-ri --version ${ES_PLUGIN_VERSION} && \
	sudo gem sources --clear-all && \
	apk del .build-deps && \
	rm -rf \
		/var/cache/apk/* \
		/home/fluent/.gem/ruby/2.5.0/cache/*.gem
