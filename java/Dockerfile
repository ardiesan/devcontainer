FROM mcr.microsoft.com/devcontainers/java:17-bookworm

SHELL ["/bin/bash", "-lc"]

RUN apt-get update && \
  apt-get -y upgrade && \
  apt -y install curl \
    git \
    mariadb-client && \
  apt-get clean

USER vscode
RUN cd ~ && git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0

RUN echo ". \"$HOME/.asdf/asdf.sh\"" >> ~/.bashrc \
echo ". \"$HOME/.asdf/completions/asdf.bash\"" >> ~/.bashrc

# Setup our workspace or workdirectory requirements
RUN \
  source ~/.asdf/asdf.sh; \
  asdf plugin add maven; \
  asdf install maven latest;

ENV LANG=C.UTF-8 PATH=/home/vscode/.asdf/bin:/home/vscode/.asdf/shims:$PATH
WORKDIR /home/vscode/project
