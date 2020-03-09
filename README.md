Construct the docker image for a JupyterLab server.

We build the image locally and push to dockerhub as the build process on dockerhub is somewhat unreliable.

Try 

`
make jupyter
`

This will fire off a Jupyter container on a port specified in `.env`.

In the `r` folder we run a few experiments with r and in particular arrow. Using arrow we try to build 
a system being able to exchange data using the arrow route. This is at a very, very experimental stage currently.

