local opts = {noremap=true, silent=true}

local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = " "

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<A-j>",":m .+1<cr>", opts)
keymap("n", "<A-k>",":m .-2<cr>", opts)
keymap("n", "<A-Down>",":m .+1<cr>", opts)
keymap("n", "<A-Up>",":m .-2<cr>", opts)

keymap("n", "<Leader>tt",":ToggleTerm direction=float<CR>", opts)
keymap("n", "<Leader>tg", "<cmd>lua _lazygit_toggle()<CR>", opts)
keymap("n", "<Leader>th", "<cmd>lua _htop_toggle()<CR>", opts)

keymap("n", "<Leader>ft", ":NvimTreeToggle<CR>", opts)
keymap("n", "<Leader>ff", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({previewer = false }))<cr>", opts)
keymap("n", "<Leader>fw", "<cmd>Telescope live_grep<cr>", opts)

keymap("t", "<Esc>", "<C-\\><C-n>", opts)

keymap("n", "<Leader>sv" ,":vs<cr>", opts)
keymap("n", "<Leader>sh" ,":sp<cr>", opts)
keymap("n", "<Leader>bp" ,":bp<cr>", opts)
keymap("n", "<Leader>bn" ,":bn<cr>", opts)
