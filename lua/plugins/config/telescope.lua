local _, telescope = pcall(require, "telescope")
if not _ then
    return
end

telescope.setup({
    defaults = {
        prompt_prefix = string.format("%s ", ""),
        selection_caret = string.format("%s ", "❯"),
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        mappings = {
            i = {},
            n = {},
        },
    },
})
