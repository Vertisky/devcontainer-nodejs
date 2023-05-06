ARG BASE_VERSION=v1.2.1
ARG NODE_VERSION=latest

FROM etma/devcontainer-base:ubuntu-${BASE_VERSION}
ARG VERSION
ARG COMMIT
ARG BUILD_DATE
ARG BASE_VERSION
ARG NODE_VERSION

LABEL \
    org.opencontainers.image.title="NodeJS DevContainer" \
    org.opencontainers.image.description="Ubuntu NodeJS image for dev containers." \
    org.opencontainers.image.url="https://github.com/vertisky/devcontainers" \
    org.opencontainers.image.documentation="https://github.com/vertisky/devcontainers" \
    org.opencontainers.image.source="https://github.com/vertisky/devcontainers" \
    org.opencontainers.image.vendor="vertisky" \
    org.opencontainers.image.authors="etma@vertisky.com" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.version=$VERSION \
    org.opencontainers.image.revision=$COMMIT \
    org.opencontainers.image.created=$BUILD_DATE

SHELL [ "/bin/zsh", "-c" ]
RUN PATH=$PATH:/root/.asdf/bin && \
    /root/.asdf/bin/asdf plugin add nodejs && \
    /root/.asdf/bin/asdf install nodejs $NODE_VERSION && \
    /root/.asdf/bin/asdf global nodejs $NODE_VERSION
