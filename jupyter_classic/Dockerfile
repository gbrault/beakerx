# Set the base image to beakerx
FROM jupyter/scipy-notebook:1386e2046833 as jupyter

# File Author / Maintainer
MAINTAINER Thomas Schmelzer "thomas.schmelzer@lobnek.com"

# copy the config file
COPY jupyter_notebook_config.py /etc/jupyter/jupyter_notebook_config.py

#RUN conda install -y -c conda-forge r-arrow
RUN conda config --env --add pinned_packages 'openjdk>8.0.121'

# install rise and cvxpy
RUN conda install -y -c conda-forge rise cvxpy beakerx notebook=6.0.1
RUN pip install --no-cache-dir pyarrow==0.14.1 python-highcharts==0.4.2

# ----------------------------------------------------------------------------------------
FROM jupyter as jupyterlab

#RUN conda install -c plotly -c defaults -c conda-forge "jupyterlab>=1.0" jupyterlab-dash=0.1.0a3

RUN conda install -y -c conda-forge jupyterlab && \
    jupyter labextension install @jupyter-widgets/jupyterlab-manager && \
    jupyter labextension install beakerx-jupyterlab && \
    jupyter labextension install @jupyterlab/celltags && \
    jupyter lab build

RUN conda install -c plotly -c defaults -c conda-forge "jupyterlab>=1.0" jupyterlab-dash && \
    jupyter labextension install jupyterlab-dash

