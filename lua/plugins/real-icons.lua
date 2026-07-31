return {
  "Mirsmog/real-icons.nvim",
  build = ":RealIconsInstallPack material",
  opts = {
    pack = "material",
    integrations = {
      bufferline = true,
      lualine = true,
      mini_files = false,
      neo_tree = true,
      nvim_tree = false,
      oil = false,
      snacks_picker = false,
      telescope = true,
      telescope_file_browser = true,
    },
  },
}
