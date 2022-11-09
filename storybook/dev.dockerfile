# This Dockerfile can be used to build a development environment with
# Node.js 16.17.0 & PNPM 7.14.2.
# Recommended usage: 
# docker --rm -it --userns keep-id -v .:/src --network host codeberg.org/bleonard252/pnpm-dev-env:node-16.17.0
FROM docker.io/docker/dev-environments-javascript:f710d90c15d6f6462ebf492df33a8dac11093f30
#&& echo export PS1="\[\033[38;5;2m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;10m\][\w]\[$(tput sgr0)\] >\[$(tput sgr0)\]" >> /home/user/.bashrc

USER node
ENV SHELL=/bin/bash
RUN sudo mkdir /src && sudo chown 1000:1000 /src && sudo corepack enable && corepack prepare pnpm@7.14.2 --activate && pnpm setup
WORKDIR /src
VOLUME /src

CMD ["/bin/bash"]