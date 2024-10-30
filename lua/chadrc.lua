-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "chadracula-evondev",
}

M.nvdash = {
  load_on_startup = true,
}

M.term = {
  sizes = { sp = 0.3, vsp = 0.25, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
  float = {
    relative = 'editor',
    row = 0.2,
    col = 0.2,
    width = 0.6,
    height = 0.55,
    border = "single",
  },
}

return M
