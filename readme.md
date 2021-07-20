# My neovim config files.

## Features

* Native LSP configuration (For js,ts,lua,python,viml,css(and its preprocessors) and html for now)
* Plugin manager written in lua (Packer)
* Personal key mappings
* IDE-like features such rename symbols, go-to definition and others
* Good amount of lua written plugins
* Tree-sitter syntax highlighting

## Installation 

1. Download and install neovim version 5.0+ (Build from source if not yet available for your distro)
1. clone this repository to `.config/nvim` (Linux) `git clone https://www.github.com/JP-Go/jpnvimrc ~/.config/nvim`
1. Follow the [packer.nvim](https://github.com/wbthomason/packer.nvim) guide to install packer
1. Open neovim and run `:PackerInstall` to install all the plugins.
