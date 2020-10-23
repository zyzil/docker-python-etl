FROM zyzil/python-etl-base

LABEL maintainer="Kevin Mullins <kmullins@gmail.com>"

USER etluser

COPY ./requirements.txt /tmp/requirements.txt
WORKDIR /tmp
RUN pip install --compile --no-cache-dir --user wheel \
    && pip install --compile --no-cache-dir --user -r requirements.txt
