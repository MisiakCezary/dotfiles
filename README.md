# dotfiles
## Requirements
Requires git and stow:
```bash
sudo apt install git stow
```

## Install
Cloning repository:
```bash
cd ~; git clone https://github.com/MisiakCezary/dotfiles
```

Initialize submodules:
```bash
git submodule init; git submodule update
```

Apply configuration from cloned repository using symlinks:
```bash
stow -t ~ ~/dotfiles
```

## Set nvim as git editor (or vim)
```bash
git config --global core.editor "nvim"
```

## Lsp setups
To install lsp put [LSP config](https://github.com/neovim/nvim-lspconfig/tree/master/lsp) into .config/nvim/lsp/
then reapply stow and install lsp for that language.
