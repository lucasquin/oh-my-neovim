## My setup guide for Neovim | Vim

1. Install [Python 3](https://www.python.org/downloads/) and add it to the system path.
2. Install pynvim library with `pip install pynvim`.
3. Install [Nodejs](https://nodejs.org/).
4. Install [Scoop](https://scoop.sh/).
5. Run `scoop install ripgrep` and `scoop install fd`.
6. Install [Chocolatey](https://jcutrer.com/windows/install-chocolatey-choco-windows10).
7. Run `choco install mingw`.
8. Install [Neovim](https://github.com/neovim/neovim/releases/tag/stable) or [Vim](https://www.vim.org/download.php). 
9. Add Neovim / Vim bin folder to system path.
10. Paste the init.vim / .vimrc_ configuration file in the following path:
**Neovim**
*Windows:* `~/AppData/Local/nvim/init.vim`
*Linux:* `~/.config/nvim/init.vim` 
**Vim**
*Windows:* `~/.vimrc_`
*Linux:* `~/.vimrc_` 
11. Install [vim-plug](https://github.com/junegunn/vim-plug)
12. Open Neovim / Vim and run `:PlugInstall`
