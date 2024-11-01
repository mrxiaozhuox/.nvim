return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      local config = require "nvchad.configs.nvimtree"
      config.filters = {
        dotfiles = true,
        custom = {
          "node_modules",
          "target",
          "vendor",
          "__pycache__",
          ".venv"
        },
      }
      return config
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    opts = function()
      local config = require "nvchad.configs.telescope"
      config.defaults.file_ignore_patterns = {
        "node_modules",
        "target",
        "vendor",
        "__pycache__",
        ".venv",
      }
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "twig",
      },
    },
  },

  { "andweeb/presence.nvim", lazy = false },

  {
    'stevearc/aerial.nvim',
    lazy = false,
    opts = {
      layout = {
        min_width = 20,
      }
    },
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
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
      }
    end,
  },

  {
    "aznhe21/actions-preview.nvim",
    lazy = true,
    config = function()
      require("actions-preview").setup {
        telescope = {
          sorting_strategy = "ascending",
          layout_strategy = "vertical",
          layout_config = {
            width = 0.8,
            height = 0.9,
            prompt_position = "top",
            preview_cutoff = 20,
            preview_height = function(_, _, max_lines)
              return max_lines - 15
            end,
          },
        },
      }
    end,
  },

  {
    "saecki/crates.nvim",
    lazy = true,
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup()
    end,
  },
}
