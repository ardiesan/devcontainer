FROM mcr.microsoft.com/devcontainers/java:17-bookworm

SHELL ["/bin/bash", "-lc"]

RUN apt-get update && apt-get -y upgrade
RUN apt -y install curl git mariadb-client

USER vscode
RUN cd ~
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0
RUN echo ". \"$HOME/.asdf/asdf.sh\"" >> ~/.bashrc
RUN echo ". \"$HOME/.asdf/completions/asdf.bash\"" >> ~/.bashrc

ENV LANG=C.UTF-8 PATH=/home/vscode/.asdf/bin:/home/vscode/.asdf/shims:$PATH
WORKDIR /home/vscode/project

# Setup our workspace or workdirectory requirements
RUN source ~/.asdf/asdf.sh
RUN exec bash; \
    asdf plugin add maven; \
    asdf install maven latest;

RUN echo $0
