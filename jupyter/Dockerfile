# Set the base image to beakerx
FROM beakerx/beakerx:1.3.0

# File Author / Maintainer
MAINTAINER Thomas Schmelzer "thomas.schmelzer@lobnek.com"

# it's better to be root as this Dockerfile will try to update conda etc.
USER root

# that's important to make sure the pip of the beakerx environment is in the path
ENV PATH /opt/conda/envs/beakerx/bin:$PATH
ENV WORK /home/$NB_USER/work

# copy the config file
COPY jupyter_notebook_config.py /etc/jupyter/jupyter_notebook_config.py

# update conda & pip
RUN conda update conda
RUN pip install --no-cache-dir --upgrade pip

# install rise and cvxpy
RUN conda install -y -n beakerx -c conda-forge rise=5.5.0 cvxpy=1.0.15 pandas=0.24.2 numba && conda clean -y --all

# this will set ownership for .conda, .config, .npm, etc...
RUN chown -R $NB_USER:$NB_USER /home/$NB_USER

# go back to the standard user
USER $NB_USER

# create the work folder
RUN mkdir -p $WORK

# output diagnosis files
RUN conda info > $WORK/conda_info.txt
RUN conda list -n beakerx > $WORK/conda_list.txt
RUN pip --version > $WORK/pip_version.txt
RUN conda --version > $WORK/conda_version.txt
