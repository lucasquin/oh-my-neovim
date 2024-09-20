![image](https://github.com/user-attachments/assets/2aae3847-1c2b-41f7-8e8f-50a90e6e733b)


<div align="center">

[![Latest release](https://img.shields.io/github/v/release/lucasquin/oh-my-neovim)](https://github.com/lucasquin/oh-my-neovim/releases/latest)
[![Latest commit](https://img.shields.io/github/last-commit/lucasquin/oh-my-neovim)](https://github.com/lucasquin/oh-my-neovim/pulse)
[![GitHub issues](https://img.shields.io/github/issues/lucasquin/oh-my-neovim)](https://github.com/lucasquin/oh-my-neovim/issues)

</div>

## About

This configuration transforms Neovim into a powerful, feature-rich development environment. It includes popular plugins, custom keybindings, and optimizations to enhance your coding experience.

## Install

```shell
# Linux / MacOS
git clone https://github.com/lucasquin/oh-my-neovim ~/.config/nvim && nvim

# Windows Prompt (CMD)
git clone https://github.com/lucasquin/oh-my-neovim %USERPROFILE%\AppData\Local\nvim && nvim

# Windows PowerShell (pwsh)
git clone https://github.com/lucasquin/oh-my-neovim $ENV:USERPROFILE\AppData\Local\nvim && nvim
```

## Update

```shell
# Linux / MacOS
git -C ~/.config/nvim pull || \
git clone https://github.com/lucasquin/oh-my-neovim ~/.config/nvim && \
nvim

# Windows Command Prompt (CMD)
if exist "%LOCALAPPDATA%\nvim" (
    cd /d "%LOCALAPPDATA%\nvim" && git pull
) else (
    git clone https://github.com/lucasquin/oh-my-neovim "%LOCALAPPDATA%\nvim"
) && nvim

# Windows PowerShell
if (Test-Path "$env:LOCALAPPDATA\nvim") {
    Set-Location "$env:LOCALAPPDATA\nvim"
    git pull
    Set-Location -
} else {
    git clone https://github.com/lucasquin/oh-my-neovim "$env:LOCALAPPDATA\nvim"
}
nvim
```

## Uninstall

```shell
# Linux / MacOS
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim

# Windows Prompt (CMD)
rd -r ~\AppData\Local\nvim
rd -r ~\AppData\Local\nvim-data

# PowerShell (pwsh)
rm -Force ~\AppData\Local\nvim
rm -Force ~\AppData\Local\nvim-data
```

## Thanks to all contributors

<div align="left"><p>
    <a href="https://github.com/lucasquin/oh-my-neovim/graphs/contributors">
      <img src="https://contrib.rocks/image?repo=lucasquin/oh-my-neovim" />
    </a>
</div>
