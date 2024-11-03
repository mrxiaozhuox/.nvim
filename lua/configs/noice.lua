require("noice").setup {
  lsp = {
    hover = {
      enabled = false,
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    signature = {
      enabled = false,
    },
  },

  presets = {
    command_palette = true,
    long_message_to_split = true,
  },
  views = {
    split = {
      enter = true,
      size = "30vsplit",
      position = "right",
    },
  },

  routes = {
    {
      filter = {
        event = "notify",
        find = "No information available",
      },
      opts = { skip = true },
    },
    -- hidden error message rust-lang/rust-analyzer#17289
    {
      filter = {
        event = "notify",
        error = true,
        find = "-32603: Invalid offset LineCol",
      },
      opts = { skip = true },
    },
  },
}
