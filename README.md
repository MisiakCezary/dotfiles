# dotfiles
## Requirements
```bash
sudo apt install git stow tar curl build-essential ripgrep
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

## In nvim install tree-sitter-cli 26 or later using mason
```
:Mason
```

## Then install treesitter for specific language
```
:TSInstall lua
```

## Add .config/nvim/lua/dap_configs.lua and customize debugging settings
```bash
cp ~/dotfiles/.config/nvim/lua/dap_configs.lua.dist ~/dotfiles/.config/nvim/lua/dap_configs.lua
```

In mason you can also install language servers and debug adapters.
