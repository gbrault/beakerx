# Set the base image to beakerx
FROM jupyter/base-notebook:lab-1.2.5

# File Author / Maintainer
MAINTAINER Thomas Schmelzer "thomas.schmelzer@lobnek.com"

USER root

# Install all OS dependencies for fully functional notebook server
RUN apt-get update && apt-get install -yq --no-install-recommends git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID

# copy the config file
COPY jupyter_notebook_config.py /etc/jupyter/jupyter_notebook_config.py

# install rise and cvxpy
RUN conda install -y -c conda-forge pandas=0.25.3 cvxpy=1.0.27 rise=5.6.1 pyarrow=0.16.0 && \
    conda clean -y --all

# clone beakerx
WORKDIR /home/jovyan
RUN git clone https://github.com/twosigma/beakerx.git
RUN conda create -n labx
RUN conda install --yes --file configuration.yml
RUN conda activate labx # For conda versions prior to 4.6, run: source activate labx
RUN conda install -y -c conda-forge jupyterlab=1
RUN (cd beakerx; pip install -r requirements.txt --verbose)
RUN beakerx install
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager --no-build
RUN (cd js/lab; jupyter labextension install . --no-build)
RUN (cd js/lab-theme-dark; jupyter labextension install . --no-build)
RUN (cd js/lab-theme-light; jupyter labextension install . --no-build)
RUN jupyter lab build

