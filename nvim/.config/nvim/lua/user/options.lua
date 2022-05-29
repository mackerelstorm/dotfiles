local options = {
	mouse = "a",
	number = true,
	relativenumber = true,
	termguicolors = true,
	undofile = true,
	expandtab = true,
	shiftwidth = 4,
	tabstop = 4,
	wrap = false,
	smartindent = true,
	cursorline = true,
    splitbelow = true,
    laststatus = 3,
}





for k, v in pairs(options) do
	vim.opt[k] = v
end
