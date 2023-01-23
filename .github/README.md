# `nvim`

- [NeoVim (`nvim`)](https://neovim.io/) is a terminal based IDE.
- This is a fork of [AstroNvim](https://github.com/AstroNvim/AstroNvim) configurations for `nvim`,
with custom modifications.
- For custom modifications changes to AstroNvim, the only thing that changes here is `lua/user/init.lua`


## Prerequisits

1. NeoVim (`nvim`) is installed, version greater than 0.70: [Instructions here](https://github.com/neovim/neovim/wiki/Installing-Neovim)

2. `node` is installed and up to date: [Instructions here](https://nodejs.org/en/)

3. Install and set programming font ([NerdFont](https://www.nerdfonts.com/))
     - [Downlaod here](https://www.nerdfonts.com/font-downloads) and install
     - Don't forget to set terminal font to this new font
     - Recommend: FiraCode Nerd Font

4. If Ubuntu, `sudo apt install vim-gtk`


## Setup

1. Clone into the right path:
    - MacOS/Linux:
		- `git clone https://github.com/ismet55555/nvim.git ~/.config/nvim`
    - Windows:
		- `git clone https://github.com/ismet55555/nvim.git ~/AppData/Local/nvim`

2. Open `nvim` by entering `nvim`

3. Within `nvim`, initalize Packer package manger setup
	- `:PackerSync`

3. Within `nvim`, install all that apply:
	- `:Mason` - Select item and press `i`
		- (2) Language Server Protocols (LSP)
		- (3) Debug Adapter Protocol (DAP)
		- (4) Linter
		- (5) Formatter

4. Within `nvim`, install tree sitter parser for select languages
	- `:TSInstall python`
	- `:TSInstall go`
	- `:TSInstall yaml`
	- [All Supported Languages](https://github.com/nvim-treesitter/nvim-treesitter#supported-languages)

## Removing `nvim` Configs

- MacOS/Linux: `rm -rf ~/.config/nvim && rm -rf ~/.local/share/nvim && rm -rf ~/.cache/nvim`
- Windows: `Remove-Item -Force -Recurse ~\AppData\Local\nvim; Remove-Item -Force -Recurse ~\AppData\Local\nvim-data`
