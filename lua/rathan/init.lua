-- YES I dont understand it either but i figured it out by myself anyway

require("rathan.lazy")
require("rathan.nvimconfig")
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
                                         /                            
]]

print(rathan)



--colorscheme configuration

local colorScheme = require("rose-pine")

require('darkvoid').setup({
    transparent = true,
    glow = true,
    show_end_of_buffer = true,

    colors = {
        fg = "#c0c0c0",
        bg = "#1c1c1c",
        cursor = "#bdfe58",
        line_nr = "#404040",
        visual = "#303030",
        comment = "#585858",
        string = "#d1d1d1",
        func = "#e1e1e1",
        kw = "#f1f1f1",
        identifier = "#b1b1b1",
        type = "#a1a1a1",
        type_builtin = "#c5c5c5", -- current
        -- type_builtin = "#8cf8f7", -- glowy blue old (was present by default before type_builtin was introduced added here for people who may like it)
        search_highlight = "#1bfd9c",
        operator = "#1bfd9c",
        bracket = "#e6e6e6",
        preprocessor = "#4b8902",
        bool = "#66b2b2",
        constant = "#b2d8d8",

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
        pmenu_sel_bg = "#1bfd9c",
        pmenu_fg = "#c0c0c0",

        -- EndOfBuffer color
        eob = "#3c3c3c",

        -- Telescope specific colors
        border = "#585858",
        title = "#bdfe58",

        -- bufferline specific colors
        bufferline_selection = "#1bfd9c",

        -- LSP diagnostics colors
        error = "#dea6a0",
        warning = "#d6efd8",
        hint = "#bedc74",
        info = "#7fa1c3",
    },
})

vim.cmd("colorscheme darkvoid")
-- vim.cmd("colorscheme rose-pine-main")
-- vim.cmd("colorscheme rose-pine-moon")
-- vim.cmd("colorscheme rose-pine-dawn")
--vim.api.nvim_set_hl(0,"Normal", {bg = "none"})
--vim.api.nvim_set_hl(0,"NormalFloat", {bg = "none"})

--Treesitter configurations
local treesitter = require('nvim-treesitter.configs')
treesitter.setup ({
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python", "cpp", "java" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
})
