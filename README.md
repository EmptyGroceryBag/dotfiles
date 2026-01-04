# VSCode Configuration
## Copy `settings.json` and `keybindings.json` to `/Users/$USER/Library/Application Support/Code/User/`

# Neovim Configuration
## Dependencies
- Node.js
- npm
- clangd
    - On FreeBSD, run `pkg install llvmXX`. clangd is located in `/usr/local/llvm18/bin`

## Installation
- Copy `.config/nvim` to `~/.config/nvim` (`%USERPROFILE%\AppData\Local\nvim\` on Windows)
- Run `git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim`
- Open nvim and run `PackerSync`.
- Run `PackerSync` once more.
- Close and reopen nvim to install TreeSitter parsers

## COC Extensions
- `coc-clangd`
- `coc-pyright`

