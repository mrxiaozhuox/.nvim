require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- terminal
map({ "n", "t" }, "<C-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggle vertical term" })

map({ "n", "t" }, "<C-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggle horizontal term" })

map({ "n", "t" }, "<C-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

-- telescope
map("n", "<leader>fd", "<cmd> Telescope diagnostics <CR>", { desc = "telescope diagnostics list" })
map("n", "<leader>fs", "<cmd> Telescope lsp_document_symbols <CR>", { desc = "telescope symbols" })
map("n", "<leader>fr", "<cmd> Telescope lsp_references <CR>", { desc = "telescope references list" })

-- crate management
map("n", "<leader>cf", function ()
  require("crates").show_features_popup()
  require("crates").focus_popup()
end, { desc = "crates toggle crate features popup" })

map("n", "<leader>cv", function ()
  require("crates").show_versions_popup()
  require("crates").focus_popup()
end, { desc = "crates tootle crate versions popup" })

-- copilot
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true, desc = "copilot accept change" })

local nomap = vim.keymap.del

-- delete default terminal
nomap({"n", "t"}, "<A-v>")
nomap({"n", "t"}, "<A-h>")
nomap({"n", "t"}, "<A-i>")
nomap("n", "<leader>h")
nomap("n", "<leader>v")


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
