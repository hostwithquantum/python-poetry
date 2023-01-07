FROM python:3.11.1-slim-buster

LABEL org.opencontainers.image.description "Docker (base) image with Python 3.x with poetry"

# making this explicit
USER root
ENV POETRY_CMD=/root/.local/bin/poetry

RUN apt-get update -y \
    && apt install \
        --no-install-recommends -y \
        build-essential \
        jq \
    && pip install --user poetry \
    && rm -rf /root/.cache/pip \
    && mkdir -p /workspace

WORKDIR /workspace
