local _, startup = pcall(require, "startup")
if not _ then
    return
end

startup.setup({
    theme = "dashboard"
})
