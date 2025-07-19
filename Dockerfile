FROM ubuntu:22.04

LABEL maintainer="ashutoshtrirpform@gmail.com"
LABEL purpose="Compare Docker with VirtualBox"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    time \
    htop \
    curl && \
    apt-get clean

WORKDIR /benchmark

COPY benchmark.py .

CMD [ "bash" ]