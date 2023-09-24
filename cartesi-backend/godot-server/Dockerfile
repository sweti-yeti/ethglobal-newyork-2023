# syntax=docker.io/docker/dockerfile:1.4
FROM --platform=linux/riscv64 knightwavegg/godot-ctsi:latest

WORKDIR /opt/cartesi/dapp

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3.10-venv \
    build-essential=12.9ubuntu3 \
    && rm -rf /var/lib/apt/lists/* \
    && find /var/log \( -name '*.log' -o -name '*.log.*' \) -exec truncate -s 0 {} \;

RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY ./server .
COPY ./cast.py .

COPY ./entrypoint.sh .
COPY ./requirements.txt .

RUN pip3 install -r requirements.txt --no-cache \
    && find /opt/venv -type d -name __pycache__ -exec rm -r {} +