# syntax=docker.io/docker/dockerfile:1.4
FROM --platform=linux/riscv64 knightwavegg/godot-ctsi:latest

WORKDIR /opt/cartesi/dapp

COPY ./server .

COPY ./entrypoint.sh .

RUN ls -l