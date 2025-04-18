--  YES I dont understand it either but i figured it out by myself anyway
require("rathan.lazy")         --Lazy config files
require("rathan.pluginConfig") --All plugin specific configurations
require("rathan.remap")        --Custom key remaps

-- Behold! the unecessary ASCII art

local rathan = [[
     ##### /##                         /
  ######  / ##                       #/
 /#   /  /  ##                 #     ##
/    /  /   ##                ##     ##
    /  /    /                 ##     ##
   ## ##   /       /###     ######## ##  /##      /###   ###  /###
   ## ##  /       / ###    ########  ## / ###    / ###    ###/ ####
   ## ###/       /   ###      ##     ##/   ###  /   ###    ##   ###
   ## ##  ###   ##    ##      ##     ##     ## ##    ##    ##    ##
   ## ##    ##  ##    ##      ##     ##     ## ##    ##    ##    ##
   #  ##    ##  ##    ##      ##     ##     ## ##    ##    ##    ##
      /     ##  ##    ##      ##     ##     ## ##    ##    ##    ##
  /##/      ### ##    /#      ##     ##     ## ##    /#    ##    ##
 /  ####    ##   ####/ ##     ##     ##     ##  ####/ ##   ###   ###
/    ##     #     ###   ##     ##     ##    ##   ###   ##   ###   ###
#                                           /
 ##                                        /
                                          /


]]

print(rathan)
print("Is this big ass ASCII art necessary? No, Did i add it anyway? Fuck yes!")

--Godot stuffs

local pipepath = vim.fn.stdpath("cache") .. "/server.pipe"
if not vim.loop.fs_stat(pipepath) then
	vim.fn.serverstart(pipepath)
end
--general vim configurations

vim.opt.expandtab = false
vim.opt.signcolumn = "yes"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.scrolloff = 8
vim.opt.cursorline = true
vim.g.have_nerd_font = false
vim.opt.undofile = true
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.updatetime = 800
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = "┊ ", trail = ".", nbsp = "␣" }

--vim.fn.sign_define("DiagnosticSignError", { text = "❖", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignError", { text = "🤦", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "✯", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignHint", { text = "⚑", texthl = "DiagnosticSignHint" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "⧐", texthl = "DiagnosticSignInfo" })

-- dealing with transparency?
vim.cmd([[
 highlight! link LspSignatureActiveParameter IncSearch
 highlight! FloatBorder guibg=NONE guifg=#888888
 highlight! NormalFloat guibg=NONE
 ]])
