--colorscheme configurations
local colorScheme = require("darkvoid")
local isTransparentandGlow = true
colorScheme.setup({
    transparent = isTransparentandGlow,
    glow = isTransparentandGlow,
    show_end_of_buffer = true,
    colors = {
        fg = "#ffeeee",
        bg = "#040409",
        cursor = "#ffa0a0",
        line_nr = "#ff1010",
        visual = "#690202",
        comment = "#808080",
        string = "#e4b2ab",
        func = "#ff6347",
        kw = "#ff5555",
        identifier = "#d2d2d2",
        type = "#a1a1a1",
        type_builtin = "#c5c5c5", -- current
        --type_builtin = "#8cf8f7", -- glowy blue old (was present by default before type_builtin was introduced added here for people who may like it)
        search_highlight = "#ffaa00",
        operator = "#d63e3e",
        bracket = "#ffeeee",
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
        warning = "#ffee00",
        hint = "#00ffee",
        info = "#14ff6a",
    },
})

vim.cmd("colorscheme darkvoid")

--Lualine configurations

require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "Ra-lualine",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = true,
        refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
        },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
})

--Treesitter configurations

local treesitter = require("nvim-treesitter.configs")
treesitter.setup({
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
        "python",
        "cpp",
        "java",
        "gdscript",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})

--Harpoon with telescope configurations

local harpoon = require("harpoon")
harpoon:setup({})

local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers")
        .new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
                results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
        })
        :find()
end

vim.keymap.set("n", "<leader>e", function()
    toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })

--chafa nvim
require("chafa").setup({
    render = {
        min_padding = 5,
        show_label = true,
    },
    events = {
        update_on_nvim_resize = true,
    }
})

--UndoTree configuration

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

--Lsp configurations

local mason = require("mason")
local masonConf = require("mason-lspconfig")
local lspconfig_defaults = require("lspconfig").util.default_config
local lspconfig = require("lspconfig")

lspconfig_defaults.capabilities =
    vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())
mason.setup({
    ui = {
        border = "rounded"
    }
})
masonConf.setup({
    handlers = {
        function(server_name)
            require("lspconfig")[server_name].setup({})
        end,
    },
})

lspconfig.gdscript.setup({ lspconfig_defaults.capabilities })

lspconfig.arduino_language_server.setup({
    cmd = {
        "arduino-language-server",
        "-clangd",
        "clangd",
        "/home/rathanthegreatlol/.local/share/nvim/mason/bin/clangd",
        "-cli",
        "/home/rathanthegreatlol/bin/",
        "-cli-config",
        "~/.arduino15/arduino-cli.yaml",
        "-fqbn",
        "arduino:avr:uno",
    },
})

lspconfig.clangd.setup({
    cmd = { "clangd", "--compile-commands-dir=" .. vim.loop.cwd() },
    filetypes = { "c", "cpp", "objc", "objcpp", "arduino" },
    init_options = {
        usePlaceholders = true,
        completeUnimported = true,
    },
})

-- Lsp-Signature configurations
require("lsp_signature").setup({
    floating_window = true,
    hint_enable = false, -- disable inline hint if it's annoying
    handler_opts = {
        border = "rounded",
    },
    floating_window_above_cur_line = true, -- move it up
})

--nvim-cmp configurations
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local luasnip = require("luasnip")
local lspkind = require('lspkind')
local cmp = require("cmp")
cmp.setup({
    formatting = {
        format = lspkind.cmp_format({
            mode = 'text_symbol', -- show only symbol annotations
            maxwidth = {
                -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                -- can also be a function to dynamically calculate max width such as
                -- menu = function() return math.floor(0.45 * vim.o.columns) end,
                menu = 50,            -- leading text (labelDetails)
                abbr = 50,            -- actual suggestion item
            },
            ellipsis_char = '...',    -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            show_labelDetails = true, -- show labelDetails in menu. Disabled by default
            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(entry, vim_item)
                -- ...
                return vim_item
            end
        })
    },

    sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" },
        { name = "luasnip" },
        { name = "html-css" },
    },

    mapping = cmp.mapping.preset.insert({
        -- Navigate between completion items
        ["<A-k>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
        ["<A-j>"] = cmp.mapping.select_next_item({ behavior = "select" }),
        -- `Enter` key to confirm completion
        ["<A-i>"] = cmp.mapping.confirm({ select = false }),
        -- Ctrl+Space to trigger completion menu
        ["<C-Space>"] = cmp.mapping.complete(),
        -- Scroll up and down in the completion documentation
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
    }),
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
})
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

--Minimap configurations
vim.cmd("highlight minimapCursor ctermbg=59  ctermfg=228 guibg=#5F5F5F guifg=#ff5555")
vim.cmd("highlight minimapCursor ctermbg=238  ctermfg=228 guibg= #121212 guifg = #d70000")
vim.cmd("highlight minimapRange ctermbg=242 ctermfg=228 guibg= #262626 guifg = #ff5555")
vim.cmd("highlight minimapDiffRemoved ctermfg=197 guifg=#c70a52")
vim.cmd("highlight minimapDiffAdded ctermfg=148 guifg=#82b500")
vim.cmd("highlight minimapDiffLine ctermfg=141 guifg=#9162f0")
vim.cmd("highlight minimapCursorDiffRemoved ctermbg=59 ctermfg=197 guibg=#5F5F5F guifg=#FC1A70")
vim.cmd("highlight minimapCursorDiffAdded ctermbg=59 ctermfg=148 guibg=#5F5F5F guifg=#A4E400")
vim.cmd("highlight minimapCursorDiffLine ctermbg=59 ctermfg=141 guibg=#5F5F5F guifg=#AF87FF")
vim.cmd("highlight minimapRangeDiffRemoved ctermbg=242 ctermfg=197 guibg=#4F4F4F guifg=#FC1A70")
vim.cmd("highlight minimapRangeDiffAdded ctermbg=242 ctermfg=148 guibg=#4F4F4F guifg=#A4E400")
vim.cmd("highlight minimapRangeDiffLine ctermbg=242 ctermfg=141 guibg=#4F4F4F guifg=#AF87FF")

--LuaSnip and snippet loader configurations
local ls = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/additional files/snippets/" })

vim.keymap.set({ "i" }, "<leader>fk", function()
    ls.expand()
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function()
    ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function()
    ls.jump(-1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })

--Conform-nvim configurations
local conform = require("conform")
conform.setup({
    formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { "rustfmt", lsp_format = "fallback" },
        -- Conform will run the first available formatter
        javascript = { "prettierd", "prettier", stop_after_first = true },
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
    },
    vim.keymap.set("n", "<leader>fo", function()
        conform.format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 500,
        })
    end, { desc = "Format on keypress" }),
})

--Autotag configuration
require('nvim-ts-autotag').setup({
    opts = {
        -- Defaults
        enable_close = true,          -- Auto close tags
        enable_rename = true,         -- Auto rename pairs of tags
        enable_close_on_slash = false -- Auto close on trailing </
    },
    -- Also override individual filetype configs, these take priority.
    -- Empty by default, useful if one of the "opts" global settings
    -- doesn't work well in a specific filetype
    -- per_filetype = {
    -- 	["html"] = {
    -- 		enable_close = false
    -- 	}
    -- }
})

-- idl liveserver??
require('live-server').setup(opts)
