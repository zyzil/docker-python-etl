FROM zyzil/python-etl-azure

LABEL maintainer="Kevin Mullins <kmullins@gmail.com>"

USER root
RUN mkdir -p /home/jovyan \
    && chown -R etluser:etluser /home/jovyan

RUN mkdir -p /usr/share/man/man1 \
    && apt-get update \ 
    && DEBIAN_FRONTEND=noninteractive apt-get -yq install openjdk-11-jre-headless \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && java -version

USER etluser

COPY ./requirements.txt /tmp/requirements.txt
WORKDIR /tmp
RUN pip install --no-cache-dir --user wheel \
    && pip install --no-cache-dir --user -r requirements.txt

WORKDIR /home/jovyan
CMD ["jupyter", "lab", "--no-browser", "--ip=0.0.0.0", "--NotebookApp.token=", "--NotebookApp.password="]

EXPOSE 8888