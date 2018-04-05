# Set the base image to Ubuntu
FROM alpine:3.7

RUN apk add --no-cache python3-dev postgresql-dev git bash && \
    apk add --no-cache --virtual .build-deps g++ && \
    ln -s /usr/include/locale.h /usr/include/xlocale.h && \
    pip3 install --upgrade pip && \
    pip3 install --no-cache-dir numpy==1.14.0 && \
    pip3 install --no-cache-dir pandas==0.21.0 && \
    pip3 install --no-cache-dir sqlalchemy==1.2.6 && \
    pip3 install --no-cache-dir psycopg2 && \
    pip3 install --no-cache-dir requests && \
    apk del .build-deps
#
#
#
## Set the base image to Ubuntu
#FROM continuumio/miniconda3
#
##COPY requirements.txt requirements.txt
#
#RUN pip install --upgrade pip && \
#    conda update -y conda && \
#    conda install -y pandas=0.21.0 requests && \
#    pip install --no-cache-dir psycopg2-binary && \
#    pip install --no-cache-dir sqlalchemy && \
#    conda clean -y --all
