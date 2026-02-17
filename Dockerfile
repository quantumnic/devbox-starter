FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive
ARG NODE_VERSION=22
ARG GO_VERSION=1.22.5
ARG PYTHON_VERSION=3.12

# System packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    ca-certificates \
    git \
    jq \
    ripgrep \
    fd-find \
    fzf \
    zsh \
    vim \
    make \
    unzip \
    wget \
    python${PYTHON_VERSION} \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

# Go
RUN curl -fsSL "https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz" \
    | tar -C /usr/local -xz
ENV PATH="/usr/local/go/bin:/root/go/bin:${PATH}"

# Node.js via nvm
ENV NVM_DIR="/root/.nvm"
RUN curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash \
    && . "$NVM_DIR/nvm.sh" \
    && nvm install ${NODE_VERSION} \
    && nvm alias default ${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}.0.0/bin:${PATH}"

# GitHub CLI
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
    > /etc/apt/sources.list.d/github-cli.list \
    && apt-get update && apt-get install -y gh && rm -rf /var/lib/apt/lists/*

# Shell setup
COPY dotfiles/.zshrc /root/.zshrc
COPY dotfiles/.gitconfig /root/.gitconfig
COPY dotfiles/.vimrc /root/.vimrc

SHELL ["/bin/zsh", "-c"]
WORKDIR /workspace
CMD ["zsh"]
