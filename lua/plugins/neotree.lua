return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = { width = 35 },
      filesystem = {
        filtered_items = {
          hide_by_name = {
            -- Node
            "pnpm-lock.yaml",
            "package-lock.json",
            "node_modules",

            -- python
            "__pycache__",

            -- rust
            "target",
          },
        },
        group_empty_dirs = true,
      },
    },
  },
}
