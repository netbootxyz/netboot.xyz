ARG NBXYZ_OVERRIDES=default

FROM ghcr.io/netbootxyz/builder:latest AS builder

# repo for build
COPY . /ansible

FROM builder AS netbootxyz-default
ENV EXTRA_VARS=""

FROM builder AS netbootxyz-production
ENV EXTRA_VARS="--extra-vars @script/netbootxyz-overrides.yml"

FROM netbootxyz-${NBXYZ_OVERRIDES} AS final
RUN \
  echo "**** running ansible ****" && \
  cd /ansible && \
  ansible-playbook site.yml ${EXTRA_VARS}

# runtime stage
FROM alpine:latest

COPY --from=final /var/www/html/ /mnt/
COPY docker-build-root/ /

ENTRYPOINT [ "/dumper.sh" ]
