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

## Install tree-sitter-cli from cargo
```bash
curl https://sh.rustup.rs -sSf | sh ; cargo install --locked tree-sitter-cli
```

## Install plugins in nvim
```
:PlugInstall
```

## Lsp setups
To install new language support:
1. Put chosen [LSP config](https://github.com/neovim/nvim-lspconfig/tree/master/lsp) into .config/nvim/lsp/
2. Add config at the end of .config/nvim/lua/init.lua
3. Reapply stow
4. Install language server for that language
