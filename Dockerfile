FROM python:3.11-slim

LABEL org.opencontainers.image.description "Docker (base) image with Python 3.x with poetry"

ARG POETRY_VERSION=1.7.0
ARG POETRY_HOME=/opt/poetry

# making this explicit
USER root

ADD https://install.python-poetry.org /tmp/install-poetry

RUN apt update -y \
    && apt install \
        --no-install-recommends -y \
        build-essential \
        jq \
        git \
    && POETRY_VERSION=${POETRY_VERSION} python3 /tmp/install-poetry \
    && rm /tmp/install-poetry \
    && mkdir -p /workspace

ENV PATH="$POETRY_HOME/bin:$PATH"
WORKDIR /workspace


ENTRYPOINT ["poetry"]
