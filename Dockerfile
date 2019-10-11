FROM gitlab-registry.cern.ch/atlas-flavor-tagging-tools/training-images/ml-cpu/ml-cpu
RUN pip install jupyter
ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}
ENV SHELL bash
RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
WORKDIR ${HOME}
RUN "echo "export PS1='$> '" > ~/.bashrc"
