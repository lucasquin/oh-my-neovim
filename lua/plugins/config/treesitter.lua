local _, treesitter = pcall(require, "nvim-treesitter.configs")
if not _ then
    return
end

treesitter.setup({
    ensure_installed = {
        "markdown",
        "markdown_inline",
    },
    sync_install = false,
    auto_install = true,
    ignore_install = {},
    highlight = {
        enable = true,
        disable = function(_, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local _, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if _ and stats and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = true,
        incremental_selection = {
            enable = true,
        },
    },
})
