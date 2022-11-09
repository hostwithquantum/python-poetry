FROM python:3.11.0-buster

LABEL org.opencontainers.image.description "Docker (base) image with Python 3.x with poetry"

ENV POETRY_CMD=/root/.local/bin/poetry

RUN apt-get update -y \
    && apt-get install -y \
        build-essential \
        jq \
    && pip install --user poetry \
    && mkdir -p /workspace

WORKDIR /workspace
