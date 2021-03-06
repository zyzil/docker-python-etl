# Build stage - this will be used to compile packages and dependencies for python env
FROM python:3.8.6-slim-buster AS build

LABEL maintainer="Kevin Mullins <kmullins@gmail.com>"

COPY ./microsoft.asc /tmp/microsoft.asc
WORKDIR /tmp

RUN apt-get update \ 
    && DEBIAN_FRONTEND=noninteractive apt-get -yq install gnupg \
    && apt-key add /tmp/microsoft.asc \
    && echo "deb [arch=amd64] https://packages.microsoft.com/debian/10/prod buster main" > /etc/apt/sources.list.d/mssql-release.list \
    && apt-get update \ 
    && apt-get -yq upgrade \
    && ACCEPT_EULA=Y DEBIAN_FRONTEND=noninteractive apt-get -yq install build-essential libpq-dev msodbcsql17 unixodbc-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY ./requirements.txt /tmp/requirements.txt
WORKDIR /tmp
RUN pip install --compile --no-cache-dir --user wheel \
    && pip install --compile --no-cache-dir --user -r requirements.txt

# base image - this will serve ass the base python environment with packages installed
FROM python:3.8.6-slim-buster AS base

COPY ./microsoft.asc /tmp/microsoft.asc
WORKDIR /tmp

RUN apt-get update \ 
    && DEBIAN_FRONTEND=noninteractive apt-get -yq --no-install-recommends install gnupg \
    && apt-key add /tmp/microsoft.asc \
    && echo "deb [arch=amd64] https://packages.microsoft.com/debian/10/prod buster main" > /etc/apt/sources.list.d/mssql-release.list \
    && apt-get update \ 
    && apt-get -yq upgrade \
    && ACCEPT_EULA=Y DEBIAN_FRONTEND=noninteractive apt-get -yq --no-install-recommends install msodbcsql17 libpq5 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash etluser
USER etluser
WORKDIR /home/etluser
COPY --from=build --chown=etluser:etluser /root/.local /home/etluser/.local
ENV PATH=/home/etluser/.local/bin:$PATH

CMD ["python"]