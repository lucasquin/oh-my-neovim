## ⚡ Requirements

- [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
- [Neovim 0.8+](https://github.com/neovim/neovim/releases/tag/stable)
- [Tree-sitter CLI](https://github.com/tree-sitter/tree-sitter/blob/master/cli/README.md)
- [ripgrep](https://github.com/BurntSushi/ripgrep) - live grep telescope search (`<leader>fg`)
- [C compiler](https://gcc.gnu.org/)
- [NodeJs](https://nodejs.org/en/download)
- [Python 3](https://www.python.org/downloads/)

- A clipboard tool is necessary for the integration with the system clipboard (see [`:help clipboard-tool`](https://neovim.io/doc/user/provider.html#clipboard-tool) for supported solutions)
- Terminal with true color support (for the default theme, otherwise it is dependent on the theme you are using)

## Keymaps

These are the default keymaps, in the following shortcuts, the `<leader>` key is set up to `\` character, see: [keymaps.lua](./lua/core/keymaps.lua).

| Shortcut             | Mode          | Description                                       |
|----------------------|---------------|---------------------------------------------------|
| `<leader>fm`         | Normal        | Format file                                       |
| `<leader>nh`         | Normal        | Clear search highlights                           |
| `<leader>ff`         | Normal        | Find files                                        |
| `<leader>fg`         | Normal        | File grep                                         |
| `<Ctrl> + {h,j,k,l}` | Normal        | Move around splits windows                        |
| `<Ctrl> + a`         | Normal        | Select all                                        |
| `<Ctrl> + s`         | Normal        | Save file                                         |
| `<Ctrl> + t`         | Normal        | Toggle terminal                                   |

## 📦 Basic Setup 

Enter `:Mason` for UI and select your lang for enable LSP

## 🖼️ Screenshots with different colorschemes
![neovim](https://github.com/lucasquin/AsteroidVim/assets/65108092/48b3461c-4efc-4157-9a4c-3c5e0cc7c47b)
![image](https://github.com/lucasquin/AsteroidVim/assets/65108092/5096ee93-cf8f-4819-8182-7d43450feb9b)
![image](https://github.com/lucasquin/AsteroidVim/assets/65108092/5b8c6592-b32f-4900-b691-891dde7b948e)
![image](https://github.com/lucasquin/AsteroidVim/assets/65108092/60f9bb09-fbaf-47f9-adc6-2a958c5e40ad)



