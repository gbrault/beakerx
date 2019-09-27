# Set the base image to beakerx
FROM jupyter/scipy-notebook:1386e2046833 as jupyter


# File Author / Maintainer
MAINTAINER Thomas Schmelzer "thomas.schmelzer@lobnek.com"

# copy the config file
COPY jupyter_notebook_config.py /etc/jupyter/jupyter_notebook_config.py

#RUN conda install -y -c conda-forge r-arrow
RUN conda config --env --add pinned_packages 'openjdk>8.0.121'

# install rise and cvxpy
#RUN conda install -y -c conda-forge rise cvxpy beakerx

RUN conda install -y -c conda-forge pyarrow


RUN conda list



FROM jupyter as jupyterlab

RUN conda install -y -c conda-forge jupyterlab && \
    jupyter labextension install @jupyter-widgets/jupyterlab-manager && \
    jupyter labextension install beakerx-jupyterlab && \
    jupyter labextension install @jupyterlab/celltags && \
    jupyter lab build

