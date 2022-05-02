FROM python:3.10-buster

ENV POETRY_CMD=/root/.local/bin/poetry

RUN apt-get update -y \
    && apt-get install -y \
        build-essential \
        jq \
    && pip install --user poetry \
    && mkdir -p /workspace

WORKDIR /workspace
