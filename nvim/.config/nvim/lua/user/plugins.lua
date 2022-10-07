local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer"
	vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]


local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end


packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}


return packer.startup(function(use)

	-- Package manager and dependencies
	use "wbthomason/packer.nvim"
	use "nvim-lua/popup.nvim"
	use "nvim-lua/plenary.nvim"

	--Lualine
	use	"nvim-lualine/lualine.nvim"
	use	 "kyazdani42/nvim-web-devicons"

	-- Colorschemes
	use "tanvirtin/monokai.nvim"
	use "folke/tokyonight.nvim"
    use "navarasu/onedark.nvim"
    use "olimorris/onedarkpro.nvim"
    use {"catppuccin/nvim", as = "catppuccin"}

	-- Autocompletion
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-cmdline"
	use "saadparwaiz1/cmp_luasnip"
	use "hrsh7th/cmp-nvim-lua"
	use "hrsh7th/cmp-nvim-lsp"

	-- Snippets
	use "L3MON4D3/LuaSnip"
	use "rafamadriz/friendly-snippets"

	-- LSP
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
	--use "williamboman/nvim-lsp-installer"


	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}
	-- Telescope
	use {
		"nvim-telescope/telescope.nvim",
	}

    -- Autopairs
    use "windwp/nvim-autopairs"

    -- NvimTree
    use {"kyazdani42/nvim-tree.lua",
        branch = "3676e0b124c2a132857e2bbcf7f48f05228f1052"
    }

    -- Null-ls
    use "jose-elias-alvarez/null-ls.nvim"

    -- Toggleterm
    use "akinsho/toggleterm.nvim"



	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
