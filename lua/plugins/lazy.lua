local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- Commons
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-lua/plenary.nvim" },

    -- Status bar
    { "nvim-lualine/lualine.nvim" },

    -- Colorschemes
    { "Mofiqul/dracula.nvim" },
    { "catppuccin/nvim" },
    { "folke/tokyonight.nvim" },
    { "ellisonleao/gruvbox.nvim" },
    { "tanvirtin/monokai.nvim" },
    { "Mofiqul/vscode.nvim" },
    { "rebelot/kanagawa.nvim" },
    { "navarasu/onedark.nvim" },
    { "shaunsingh/nord.nvim" },
    { "projekt0n/github-nvim-theme" },
    { "rose-pine/neovim" },
    { "shaunsingh/solarized.nvim", },

    -- Syntax
    { "nvim-treesitter/nvim-treesitter" },

    -- File explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "s1n7ax/nvim-window-picker",
        },
    },

    -- Fuzzy finder
    { "nvim-telescope/telescope.nvim",      tag = "0.1.1" },

    -- Editor
    { "preservim/nerdcommenter" },
    { "fedepujol/move.nvim" },
    { "norcalli/nvim-colorizer.lua" },
    { "windwp/nvim-autopairs" },
    { "windwp/nvim-ts-autotag" },
    { "lukas-reineke/indent-blankline.nvim" },
    { "kevinhwang91/nvim-ufo",              dependencies = { "kevinhwang91/promise-async" } },
    { "luukvbaal/statuscol.nvim" },

    -- Terminal
    { 'akinsho/toggleterm.nvim' },

    -- Git
    { "sindrets/diffview.nvim" },
    { "lewis6991/gitsigns.nvim",            enabled = vim.fn.executable("git") == 1,          ft = "gitcommit" },

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },

    -- Snippets
    { "L3MON4D3/LuaSnip",                   dependencies = { "rafamadriz/friendly-snippets" } },
    { "saadparwaiz1/cmp_luasnip" },

    -- LSP
    { "onsails/lspkind.nvim" },
    { "nvimdev/lspsaga.nvim" },
    { "jay-babu/mason-null-ls.nvim" },
    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Signature
            { "hrsh7th/cmp-nvim-lsp-signature-help" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
            { "jose-elias-alvarez/null-ls.nvim" },
        }
    },

    -- ChatGPT
    { "jackMort/ChatGPT.nvim" },

    -- Highlight local cursor
    { "tzachar/local-highlight.nvim" },
}

local opts = {}

require("lazy").setup(plugins, opts)
