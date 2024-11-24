local colors = {
		--Just ignore the color names 
	red = "#ff6666",
	grey = "#2e0a08",
	black = "#0f0000",
	white = "#ffffff",
	orange = "#ffaaaa",
	orange2 = "#ff3333",
	fg = "#c0c0c0",
}

return {
  normal = {
    b = { fg = colors.red, bg = colors.grey },
    a = { fg = colors.black, bg = colors.red, gui = 'bold' },
    c = { fg = colors.white, bg = colors.black },
  },
  visual = {
    b = { fg = colors.orange, bg = colors.grey },
    c = { fg = colors.white, bg = colors.black },
    a = { fg = colors.black, bg = colors.orange, gui = 'bold' },
  },

  inactive = {
    b = { fg = colors.red, bg = colors.grey },
    c = { fg = colors.black, bg = colors.black},
    a = { fg = colors.white, bg = colors.gray, gui = 'bold' },
  },
  replace = {
    b = { fg = colors.red, bg = colors.grey },
    a = { fg = colors.black, bg = colors.red, gui = 'bold' },
    c = { fg = colors.white, bg = colors.black },
  },
  insert = {
    b = { fg = colors.orange2, bg = colors.grey },
    a = { fg = colors.black, bg = colors.orange2, gui = 'bold' },
    c = { fg = colors.white, bg = colors.black },
  },
}
