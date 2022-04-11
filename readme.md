# My neovim config files.

## Features

- Native LSP configuration
- Plugin manager written in lua (Packer)
- Personal key mappings
- Code formatter
- IDE-like features such rename symbols, go-to definition and others
- Good amount of lua written plugins
- Tree-sitter syntax highlighting

## Installation

1. Download and install neovim version 5.0+ (Build from source if not yet available for your distro)
1. Clone this repository to `.config/nvim` (Linux) `git clone https://www.github.com/JP-Go/jpnvimrc ~/.config/nvim`
1. Follow the [packer.nvim](https://github.com/wbthomason/packer.nvim) guide to install packer
1. Open neovim and run `:PackerInstall` to install all the plugins.
1. (Optional) Install LSP Servers `npm install tsserver`, `cargo install rust-analyzer`, `gem install solargraph`, (check for `ccls` in the distro repositories)
1. (Optional) Install formatters: `npm install -g prettier`, `rustup install stylua`
