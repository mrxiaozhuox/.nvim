return {
  "vyfor/cord.nvim",
  build = "./build",
  event = "VeryLazy",
  opts = {
    usercmds = true,
    plugins = {
      "cord.plugins.diagnostics",
    },
    timer = {
      interval = 1000,
      reset_on_idle = true,
      reset_on_change = true,
    },
  },
}
