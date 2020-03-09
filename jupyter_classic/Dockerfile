# Set the base image to beakerx
FROM jupyter/base-notebook:lab-1.2.5 as jupyter

# File Author / Maintainer
MAINTAINER Thomas Schmelzer "thomas.schmelzer@lobnek.com"

USER root

# Install all OS dependencies for fully functional notebook server
RUN apt-get update && apt-get install -yq --no-install-recommends \
    build-essential \
    emacs \
    git \
    inkscape \
    jed \
    libsm6 \
    libxext-dev \
    libxrender1 \
    lmodern \
    netcat \
    python-dev \
    # ---- nbconvert dependencies ----
    texlive-xetex \
    texlive-fonts-recommended \
    texlive-generic-recommended \
    # Optional dependency
    texlive-fonts-extra \
    # ----
    tzdata \
    unzip \
    nano \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID


# copy the config file
COPY jupyter_notebook_config.py /etc/jupyter/jupyter_notebook_config.py

#RUN conda config --env --add pinned_packages 'openjdk>8.0.121'

# install rise and cvxpy
RUN conda install -y -c conda-forge pandas=0.25.3 cvxpy=1.0.27 beakerx=1.4.1 rise=5.6.1 pyarrow=0.16.0 && \
    conda clean -y --all

# ----------------------------------------------------------------------------------------
FROM jupyter as jupyterlab

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager && \
    jupyter labextension install beakerx-jupyterlab && \
    jupyter lab build
