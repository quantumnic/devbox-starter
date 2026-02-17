# devbox-starter 🧰

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?logo=docker)](https://www.docker.com/)
[![Shell](https://img.shields.io/badge/Shell-Bash%20%7C%20Zsh-4EAA25?logo=gnu-bash)](https://www.gnu.org/software/bash/)

A minimal, opinionated **dev environment bootstrap** you can drop into any project. Includes a Dockerfile, shell config, Git hooks, and editor settings — everything you need to go from `git clone` to productive in under a minute.

## What's Inside

```
devbox-starter/
├── Dockerfile            # Ubuntu-based dev container (Node, Python, Go)
├── docker-compose.yml    # One-command startup
├── .devcontainer/        # VS Code Dev Container config
│   └── devcontainer.json
├── dotfiles/
│   ├── .zshrc            # Zsh config with useful aliases
│   ├── .gitconfig        # Sane Git defaults
│   └── .vimrc            # Minimal Vim config
├── hooks/
│   └── pre-commit        # Lint + typecheck before commit
├── .editorconfig         # Consistent formatting across editors
└── Makefile              # Common dev tasks
```

## Quick Start

### As a Dev Container (VS Code)

1. Copy `.devcontainer/` into your project
2. Open in VS Code → "Reopen in Container"

### Standalone

```bash
docker compose up -d
docker compose exec dev zsh
```

### Cherry-Pick

Just copy the files you need. Everything is standalone.

## Dotfiles

The `dotfiles/` directory contains portable shell and editor configs:

- **`.zshrc`** — prompt, aliases (`gs`, `gd`, `gl`, `dc`), PATH setup
- **`.gitconfig`** — colored output, pull rebase, default branch `main`
- **`.vimrc`** — line numbers, syntax highlighting, sensible defaults

## Dev Container

The Dockerfile includes:

- **Node.js 22** (via nvm)
- **Python 3.12** + pip
- **Go 1.22**
- **Common tools**: curl, jq, ripgrep, fd-find, fzf, gh CLI, make
- **Zsh** with a clean prompt

Optimised for fast rebuilds with layer caching.

## Makefile

```bash
make build    # Build the dev container
make up       # Start the container
make shell    # Attach to running container
make down     # Stop everything
make clean    # Remove containers + volumes
```

## Customisation

This is a **starting point**, not a framework. Fork it, strip what you don't need, add what you do. The goal is to eliminate "works on my machine" with minimal overhead.

## License

[MIT](LICENSE)
