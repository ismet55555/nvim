# `nvim`

- [NeoVim (`nvim`)](https://neovim.io/) is a terminal based IDE.
- This is a fork of [AstroNvim](https://github.com/AstroNvim/AstroNvim) configurations for `nvim`,
with custom modifications.
- For custom modifications changes to AstroNvim, the only thing that changes here is `lua/user/init.lua`


## Prerequisits

1. NeoVim (`nvim`) is installed, version greater than 0.80: [Instructions here](https://github.com/neovim/neovim/wiki/Installing-Neovim)

2. Ensure following are installed:
	- `pip` - You probably have it, if not: [Instructions here](https://pip.pypa.io/en/stable/installation/)
	- `node` / `npm` - [Instructions here](https://nodejs.org/en/)
	- `cargo` - [Instructions here](https://doc.rust-lang.org/cargo/getting-started/installation.html)

3. Install and setup programming font ([NerdFont](https://www.nerdfonts.com/))
     - [Downlaod here](https://www.nerdfonts.com/font-downloads) and install
     - Don't forget to set terminal font to this new font
     - Recommend: FiraCode Nerd Font
     
4. Install a clipboard cli tool:
    - MacOS: `pbcopy pbpaste` already pre-installed
    - Ubuntu/Debian: `sudo apt install -y xclip xsel vim-gtk`
    - Windows: `choco install win32yank`


## Setup

1. Clone into the right path:
    - MacOS/Linux: `git clone https://github.com/ismet55555/nvim.git $HOME/.config/nvim`
    - Windows: `git clone https://github.com/ismet55555/nvim.git $HOME/AppData/Local/nvim`

2. Open NeoVim by entering `nvim`
	- This should initialize `PackerSync`, let it finish
	- If it does not, enter `:PackerSync`

3. Within `nvim`, install all that apply:
	- `:Mason` - Select items you need and press `i`
		- (2) Language Server Protocols (LSP)
		- (3) Debug Adapter Protocol (DAP)
		- (4) Linter
		- (5) Formatter
	- [All Supported Language Servers](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

4. Within `nvim`, install tree sitter parser for select languages
	- `:TSInstall`
	- To install more languages: `:TSInstall <LANGUAGE>`
	- [All Supported Languages](https://github.com/nvim-treesitter/nvim-treesitter#supported-languages)
	
After everything installed and settled down, exit then enter again.

## Removing `nvim` Configs

- MacOS/Linux: `rm -rf $HOME/.config/nvim && rm -rf $HOME/.local/share/nvim && rm -rf $HOME/.cache/nvim`
- Windows: `Remove-Item -Force -Recurse $HOME\AppData\Local\nvim; Remove-Item -Force -Recurse $HOME\AppData\Local\nvim-data`
