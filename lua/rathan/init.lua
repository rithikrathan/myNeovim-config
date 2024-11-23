--  YES I dont understand it either but i figured it out by myself anyway

require("rathan.lazy")
require("rathan.remap")

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

--general vim configurations

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.scrolloff = 8
vim.opt.cursorline = true
vim.g.have_nerd_font = false
vim.opt.undofile = true
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = {tab = '» ', trail = ".", nbsp = "␣"}


--colorscheme configuration

local colorScheme = require("darkvoid")
colorScheme.setup({
	transparent = true,
	glow = true,
	show_end_of_buffer = true,

	colors = {
		fg = "#c0c0c0",
		bg = "#0f0f0f",
		cursor = "#e07b7b",
		line_nr = "#ff1e00",
		visual = "#303030",
		comment = "#585858",
		string = "#d4b2ab",
		func = "#ff6347",
		kw = "#ff5555",
		identifier = "#b1b1b1",
		type = "#a1a1a1",
		type_builtin = "#c5c5c5", -- current
		--type_builtin = "#8cf8f7", -- glowy blue old (was present by default before type_builtin was introduced added here for people who may like it)
		search_highlight = "#fd571b",
		operator = "#d63e3e",
		bracket = "#e6e6e6",
		preprocessor = "#4b8902",
		bool = "#ffa07a",
		constant = "#f59064",

		-- enable or disable specific plugin highlights
		plugins = {
			gitsigns = true,
			nvim_cmp = true,
			treesitter = true,
			nvimtree = true,
			telescope = true,
			lualine = true,
			bufferline = true,
			oil = true,
			whichkey = true,
			nvim_notify = true,
		},

		-- gitsigns colors
		added = "#baffc9",
		changed = "#ffffba",
		removed = "#ffb3ba",

		-- Pmenu colors
		pmenu_bg = "#1c1c1c",
		pmenu_sel_bg = "#fa3e19",
		pmenu_fg = "#fc6142",

		-- EndOfBuffer color
		eob = "#3c3c3c",

		-- Telescope specific colors
		border = "#ff1e00",
		title = "#ff1e00",

		-- bufferline specific colors
		bufferline_selection = "#fd7d1b",

		-- LSP diagnostics colors
		error = "#ff0000",
		warning = "#ff6a00",
		hint = "#e600ff",
		info = "#00ff6a",
	},
})

vim.cmd("colorscheme darkvoid")


--Treesitter configurations

local treesitter = require('nvim-treesitter.configs')
treesitter.setup ({
	-- A list of parser names, or "all" (the listed parsers MUST always be installed)
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python", "cpp", "java" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})

--Harpoon with telescope configurations
local harpoon = require('harpoon')
harpoon:setup({})

local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers").new({}, {
		prompt_title = "Harpoon",
		finder = require("telescope.finders").new_table({
			results = file_paths,
		}),
		previewer = conf.file_previewer({}),
		sorter = conf.generic_sorter({}),
	}):find()
end

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,{ desc = "Open harpoon window" })

--UndoTree configuration
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
