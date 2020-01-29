# Set the base image to beakerx
FROM jupyter/datascience-notebook:437f1ef92733 as jupyter

# File Author / Maintainer
MAINTAINER Thomas Schmelzer "thomas.schmelzer@lobnek.com"

USER root

RUN apt-get update && apt-get install less

USER $NB_UID

# copy the config file
COPY jupyter_notebook_config.py /etc/jupyter/jupyter_notebook_config.py

#RUN conda config --env --add pinned_packages 'openjdk>8.0.121'

# install rise and cvxpy
RUN conda install -y -c conda-forge beakerx=1.4.1 && \
    conda clean -y --all

#RUN pip install --no-cache-dir pyarrow==0.14.1
#CMD jupyter notebook --ip 127.0.0.1

# ----------------------------------------------------------------------------------------
FROM jupyter as jupyterlab

#RUN conda install -c plotly -c defaults -c conda-forge "jupyterlab>=1.0" jupyterlab-dash=0.1.0a3


RUN conda install -y -c conda-forge jupyterlab && \
    #conda install -c plotly -c defaults -c conda-forge "jupyterlab>=1.0" jupyterlab-dash && \
    #pip install dash_daq==0.2.2 && \
    jupyter labextension install @jupyter-widgets/jupyterlab-manager && \
    #jupyter labextension install jupyterlab_rise && \
    #jupyter labextension install jupyterlab-dash && \
    jupyter labextension install beakerx-jupyterlab && \
    jupyter labextension install @jupyterlab/celltags && \
    jupyter lab build

#RUN conda install -c plotly -c defaults -c conda-forge "jupyterlab>=1.0" jupyterlab-dash && \
    #jupyter labextension install jupyterlab-dash && \
    #pip install dash_daq==0.2.2

