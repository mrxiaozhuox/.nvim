-- based on nvchad config
local config = require "nvchad.configs.nvimtree"

config.filters = {
  dotfiles = true,
  custom = {
    "node_modules",
    "target",
    "vendor",
    "__pycache__",
    ".venv",
  },
}

return config
