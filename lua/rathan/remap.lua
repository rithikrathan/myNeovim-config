vim.opt.mouse = "a"
vim.opt.timeoutlen = 300

--Plugin specific keymaps
vim.keymap.set("n", "<leader>gs", vim.cmd.Git) --open a Git window
vim.keymap.set("n", "<leader>gg", vim.cmd.GitGutterToggle) --Toggle gitgutter
vim.keymap.set("n", "<leader>tb", vim.cmd.TagbarToggle) --Toggle Tagbar
vim.keymap.set("n", "<leader>gt", "<cmd>GitGutterLineHighlightsToggle | GitGutterLineNrHighlightsToggle<CR>") --toggle git line highlights
vim.keymap.set("n", "<leader>1", vim.cmd.Mason) --open Mason window
vim.keymap.set("n", "<leader>2", vim.cmd.Lazy) --open Lazy window
vim.keymap.set("n", "<leader>m", vim.cmd.MinimapToggle)
vim.keymap.set("n", "<leader>t", "<cmd>sp | term<CR>")

--godlike keymaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "<leader><Tab>", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })
vim.keymap.set("v", "<leader><Tab>", "<Esc>", { noremap = true, silent = true, desc = "Exit visual mode" })
vim.keymap.set("t", "<leader><Tab>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>d", "yyp", { desc = "Duplicate current line" })
vim.keymap.set("i", "<leader>;", "<C-o>", { desc = "Temporary normal mode" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move selected lines down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "H", "^") -- Move to the first non-blank character
vim.keymap.set("n", "L", "g_") -- Move to the last non-blank character
vim.keymap.set("n", "vq", 'vi"') -- Inside double quotes
vim.keymap.set("n", "vQ", 'va"') -- Around double quotes
vim.keymap.set("n", "vp", "vi(") -- Inside parentheses
vim.keymap.set("n", "vP", "va(") -- Around parentheses
vim.keymap.set("n", "<leader>vp", "vip") -- Quickly select an entire paragraph
vim.keymap.set("n", "ci", 'ci"') -- Inside double quotes
vim.keymap.set("n", "cp", "ci(") -- Inside parentheses
vim.keymap.set("v", "<leader>dd", "y'>p") -- Duplicate visual selection

--Split windows, navigations keymaps CTRL+<hjkl>
vim.keymap.set("n", "<leader>h", ":split<CR>", { desc = "Split horizontal windowx" })
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { desc = "Split vertical windowx" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Resize splits using arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>")
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>")
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>")

--Telescope keymaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope git file search" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fs", function()
	builtin.grep_string({ search = vim.fn.input("Grep >") })
end, { desc = "Telescope grep" })

--Harpoon with telescope setup and keymaps
local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<leader>s", function()
	harpoon:list():remove()
end)
vim.keymap.set("n", "<C-h>", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<C-t>", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<C-n>", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<C-s>", function()
	harpoon:list():select(4)
end)
--Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<C-S-N>", function()
	harpoon:list():next()
end)

--LSP-zero keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }
		-- > change these in the future
		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	end,
})
