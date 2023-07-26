ARG VARIANT="20-bullseye"
FROM mcr.microsoft.com/devcontainers/typescript-node:${VARIANT}

SHELL ["/bin/bash", "-lc"]

RUN apt-get update && \
  apt-get -y upgrade && \
  apt-get -y install curl \
    git \
    mariadb-client && \
  apt-get clean

ARG NODE_USER=node
USER ${NODE_USER}
RUN cd ~ && git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0

RUN echo ". \"$HOME/.asdf/asdf.sh\"" >> ~/.bashrc \
echo ". \"$HOME/.asdf/completions/asdf.bash\"" >> ~/.bashrc

# Setup our workspace or workdirectory requirements
RUN \
  npm i -g @nestjs/cli;


ENV LANG=C.UTF-8 PATH=/home/${NODE_USER}/.asdf/bin:/home/${NODE_USER}/.asdf/shims:$PATH
WORKDIR /home/${NODE_USER}/project

