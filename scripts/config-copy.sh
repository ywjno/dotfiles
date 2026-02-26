#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"
TS="$(date +%Y%m%d%H%M%S)"

backup_file() {
  local src="$1"
  local backup="$2"

  if [ -e "$backup" ]; then
    mv "$backup" "$backup.$TS"
  fi
  if [ -f "$src" ]; then
    cp -f "$src" "$backup"
  fi
}

mkdir -p "$HOME/.config/lazygit" "$HOME/.config/mise" "$HOME/.config/sheldon"

backup_file "$HOME/.gitconfig" "$HOME/.gitconfig.prefile"
backup_file "$HOME/.config/lazygit/config.yml" "$HOME/.config/lazygit/config.yml.prefile"
backup_file "$HOME/.config/mise/config.toml" "$HOME/.config/mise/config.toml.prefile"
backup_file "$HOME/.config/sheldon/plugins.toml" "$HOME/.config/sheldon/plugins.toml.prefile"

cp -f "$REPO_ROOT/.gitconfig" "$HOME/.gitconfig"
cp -f "$REPO_ROOT/.config/lazygit/config.yml" "$HOME/.config/lazygit/config.yml"
cp -f "$REPO_ROOT/.config/mise/config.toml" "$HOME/.config/mise/config.toml"
cp -f "$REPO_ROOT/.config/sheldon/plugins.toml" "$HOME/.config/sheldon/plugins.toml"

echo "Copied dotfiles config to \$HOME (backups use .prefile and .$TS)."
