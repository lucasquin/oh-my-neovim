## ✨ Plugins List 

- Auto close tag with [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)
- Autocompletion with [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- ChatGPT with [ChatGPT.nvim](https://github.com/jackMort/ChatGPT.nvim)
- File explorer with [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- Formatting and Linting with [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
- Fuzzy finding with [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- Git with [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- Language Server Protocol with [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- Pair completion with [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- Statusline with [nvim-lualine](https://github.com/nvim-lualine/lualine.nvim)
- Syntax highlighting with [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

## ⚡ Requirements

- [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
- [Neovim 0.8+](https://github.com/neovim/neovim/releases/tag/stable)
- [Tree-sitter CLI](https://github.com/tree-sitter/tree-sitter/blob/master/cli/README.md)
- [ripgrep](https://github.com/BurntSushi/ripgrep) - live grep telescope search (`<leader>fw`)
- [C compiler](https://gcc.gnu.org/)
- [NodeJs](https://nodejs.org/en/download)
- [Python 3](https://www.python.org/downloads/)

- A clipboard tool is necessary for the integration with the system clipboard (see [`:help clipboard-tool`](https://neovim.io/doc/user/provider.html#clipboard-tool) for supported solutions)
- Terminal with true color support (for the default theme, otherwise it is dependent on the theme you are using)

## 📦 Basic Setup 

#### Install LSP

Enter `:LspInstall` followed by the name of the server you want to install<br>
Example: `:LspInstall pyright`

or 

Enter `:Mason` for UI

#### Install language parser

Enter `:TSInstall` followed by the name of the language you want to install<br>
Example: `:TSInstall python`

#### Manage plugins

Run `:Lazy check` to check for plugin updates

Run `:Lazy update` to apply any pending plugin updates

Run `:Lazy clean` to remove any disabled or unused plugins

Run `:Lazy sync` to update and clean plugins

or 

Enter `:Lazy` for UI
