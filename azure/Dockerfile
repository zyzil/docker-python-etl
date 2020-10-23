FROM zyzil/python-etl-base

USER etluser

COPY ./requirements.txt /tmp/requirements.txt
WORKDIR /tmp
RUN pip install --user wheel \
    && pip install --user -r requirements.txt
