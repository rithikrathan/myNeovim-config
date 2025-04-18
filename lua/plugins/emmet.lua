return {
	{
		"mattn/emmet-vim",
		ft = { "html", "css", "javascript", "typescript", "jsx", "tsx" },
		init = function()
			vim.g.user_emmet_leader_key = "]]" -- default
		end,
	}
}
