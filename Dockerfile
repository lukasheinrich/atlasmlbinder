FROM atlasml/ml-base
RUN pip install jupyterhub && \
    pip install jupyterlab
