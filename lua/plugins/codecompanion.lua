return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    language = "Chinese",
    strategies = {
      chat = {},
      inline = {
        keymaps = {
          accept_change = {
            modes = { n = "<leader>aa" },
            description = "Accept the suggested change",
          },
          reject_change = {
            modes = { n = "<leader>ar" },
            opts = { nowait = true },
            description = "Reject the suggested change",
          },
        },
      },
    },
    display = {
      diff = {
        enabled = true,
        provider = "mini_diff",
      },
    },
    adapters = {
      deepseek = function()
        return require("codecompanion.adapters").extend("deepseek", {
          env = {
            api_key = "sk-d83213cfae0e4c5f8e0faf62d469d211",
          },
        })
      end,
    },
  },
  keys = {
    { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
    {
      "<leader>ac",
      function()
        return vim.cmd("CodeCompanionChat")
      end,
      desc = "Toggle Chat",
      mode = { "n", "v" },
    },
    {
      "<leader>ap",
      function()
        return vim.cmd("CodeCompanionActions")
      end,
      desc = "Toggle Actions",
      mode = { "n", "v" },
    },
  },
}
