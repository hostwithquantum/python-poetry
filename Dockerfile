FROM python:3.14-slim

ARG POETRY_VERSION=2.3.2
ARG POETRY_HOME=/opt/poetry

LABEL org.opencontainers.image.title="python-poetry" \
      org.opencontainers.image.description="Docker (base) image with Python 3.x with poetry" \
      org.opencontainers.image.vendor="Planetary Quantum GmbH" \
      org.opencontainers.image.licenses="BSD-2-Clause" \
      org.opencontainers.image.source="https://github.com/hostwithquantum/python-poetry" \
      org.opencontainers.image.documentation="https://github.com/hostwithquantum/python-poetry#readme" \
      software.python.version="3.14" \
      software.poetry.version=${POETRY_VERSION}


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
