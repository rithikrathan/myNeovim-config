vim.opt.mouse =  "a"
vim.opt.timeoutlen = 300

--Plugin specific keymaps
vim.keymap.set("n","<leader>gs", vim.cmd.Git)--open a Git window
vim.keymap.set("n", "<leader>1", vim.cmd.Mason)--open Mason window
vim.keymap.set("n", "<leader>2", vim.cmd.Lazy)--open Lazy window
vim.keymap.set("n", "<leader>m", vim.cmd.MinimapToggle)

--godlike keymaps
vim.keymap.set("n","<leader>pv", vim.cmd.Ex)
vim.keymap.set('i', '<leader><Tab>', '<Esc>', { noremap = true, silent = true, desc = 'Exit insert mode' })
vim.keymap.set('v', '<leader><Tab>', '<Esc>', { noremap = true, silent = true, desc = 'Exit visual mode' })
vim.keymap.set('t', '<leader><Tab>', '<C-\\><C-n>', { noremap = true, silent = true, desc = 'Exit terminal mode' })
vim.keymap.set('n', '<leader>d', 'yyp', { desc = 'Duplicate current line' })
vim.keymap.set('i', '<leader>o', '<C-o>', { desc = 'Temporary normal mode'})

--Split windows, navigations keymaps CTRL+<hjkl>
vim.keymap.set('n', '<leader>h', ':split<CR>', {desc = 'Split horizontal windowx'})
vim.keymap.set('n', '<leader>v', ':vsplit<CR>', {desc = 'Split vertical windowx'})
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

--Telescope keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope git file search' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fs',function() 
	builtin.grep_string({ search = vim.fn.input("Grep >")}); 
end, {desc = 'Telescope grep'})

--Harpoon with telescope setup and keymaps
local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>s", function() harpoon:list():remove() end)
vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
--Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

--LSP-zero keymaps
vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		local opts = {buffer = event.buf}
		-- > change these in the future
		vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
		vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
		vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
		vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
		vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
		vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
		vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
		vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
		vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
		vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
	end,
})

