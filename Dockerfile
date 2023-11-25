FROM python:3.11.4-slim-buster

LABEL org.opencontainers.image.description "Docker (base) image with Python 3.x with poetry"

ARG POETRY_VERSION=1.2.0
ARG POETRY_HOME=/opt/poetry

# making this explicit
USER root

ADD https://install.python-poetry.org /tmp/install-poetry

RUN apt update -y \
    && apt install \
        --no-install-recommends -y \
        build-essential \
        jq \
    && POETRY_VERSION=${POETRY_VERSION} python3 /tmp/install-poetry \
    && rm /tmp/install-poetry \
    && ln -s ${POETRY_HOME}/bin/poetry /usr/local/bin/poetry \
    && mkdir -p /workspace

WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/poetry"]
