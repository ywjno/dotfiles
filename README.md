# dotfiles

This repository contains my development environment configuration files. It currently manages settings for `git`, `mise`, `sheldon` (Zsh plugin manager), and `lazygit`.

## Prerequisites

Install [mise](https://mise.jdx.dev/getting-started.html) first.

Recommended environments: Linux / macOS / WSL (the repository follows the `$HOME/.config` layout).

## Repository Structure

```text
.
├── .gitconfig
├── .config
│   ├── lazygit/config.yml
│   ├── mise/config.toml
│   └── sheldon/plugins.toml
└── scripts
    ├── config-copy.ps1
    └── config-copy.sh
```

- `.gitconfig`: Git aliases, diff/merge behavior, and `delta` settings
- `.config/mise/config.toml`: tool versions and reusable tasks
- `.config/sheldon/plugins.toml`: Zsh plugin definitions
- `.config/lazygit/config.yml`: Lazygit settings (uses `difft` as external diff)

## Setup

1. Clone the repository

```sh
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles
```

2. Copy the configuration files to your home directory (choose one)

The scripts back up existing files next to the originals using a fixed `.prefile` suffix plus timestamp rotation (for example, `config.toml.prefile`).

### Linux / macOS (or WSL)

```sh
./scripts/config-copy.sh
```

### Windows (PowerShell)

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\config-copy.ps1
```

3. Run commands after copying (optional but recommended)

```sh
mise install
mise tasks ls
```

4. If you use `zsh` + `sheldon`, make sure `sheldon` is installed, then add this line to `~/.zshrc`

```sh
eval "$(sheldon source)"
```

## Common Maintenance Commands

```sh
git config --file .gitconfig --list >/dev/null   # Validate .gitconfig
mise tasks ls                                    # Validate mise config parsing
git diff --check                                 # Check whitespace/conflict markers
```

## Notes

- Before changing Lazygit config, make sure `difftastic` (command: `difft`) is installed.
- Do not commit tokens, private paths, or machine-specific usernames.
