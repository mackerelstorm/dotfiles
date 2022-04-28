local opts = {noremap=true, silent=true}

local keymap = vim.api.nvim_set_keymap

keymap("n", "<F5>", ":Lex<cr>", opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<F2>", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({previewer = false }))<cr>", opts)
keymap("n", "<F3>", "<cmd>Telescope live_grep<cr>", opts)
