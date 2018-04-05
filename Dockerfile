# Set the base image to Ubuntu
FROM continuumio/miniconda3

#COPY requirements.txt requirements.txt

RUN pip install --upgrade pip && \
    conda update -y conda && \
    conda install -y pandas=0.21.0 requests && \
    pip install --no-cache-dir psycopg2-binary && \
    pip install --no-cache-dir sqlalchemy && \
    conda clean -y --all
