default:
  @just --list

# config zshrc
config-zsh:
  @curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh | bash -s -- --repo rossmacarthur/sheldon --to $HOME/.local/bin
  @sheldon init --shell zsh
  @sheldon add zsh-autosuggestions --github zsh-users/zsh-autosuggestions
  @sheldon add zsh-completions --github zsh-users/zsh-completions
  @sheldon add zsh-syntax-highlighting --github zsh-users/zsh-syntax-highlighting
  @sheldon add fast-syntax-highlighting --github zdharma-continuum/fast-syntax-highlighting
  @echo 'eval "$(sheldon source)"' >> $HOME/.zshrc

# config mise
config-mise:
  @curl https://mise.run/zsh | sh
  @mise use -g bat@latest
  @mise use -g bun@latest
  @mise use -g cargo-binstall@latest
  @mise use -g delta@latest
  @mise use -g deno@latest
  @mise use -g difftastic@latest
  @mise use -g eza@latest
  @mise use -g fd@latest
  @mise use -g fzf@latest
  @mise use -g go@latest
  @mise use -g java@temurin-25
  @mise use -g jj@latest
  @mise use -g just@latest
  @mise use -g kotlin@latest
  @mise use -g neovim@latest
  @mise use -g ripgrep@latest
  @mise use -g zig@latest
