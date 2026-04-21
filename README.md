# dotfiles
## Requirements
```bash
sudo apt install git stow tar curl build-essential
```

## Install
Cloning repository:
```bash
cd ~; git clone https://github.com/MisiakCezary/dotfiles
```

Apply configuration from cloned repository using symlinks:
```bash
stow -t ~ ~/dotfiles
```

## Seting nvim as git editor (or vim)
```bash
git config --global core.editor "nvim"
```

## Installing tree-sitter-cli 26 or later (for example from cargo)
```bash
curl https://sh.rustup.rs -sSf | sh
```
```bash
cargo install --locked tree-sitter-cli
```

## In nvim install treesitter for specific language
```
:TSInstall lua
```

## Lsp setups
To install new language support:
1. Put chosen [LSP config](https://github.com/neovim/nvim-lspconfig/tree/master/lsp) into .config/nvim/lsp/
2. Add config at the end of .config/nvim/lua/init.lua
3. Install language server for that language
