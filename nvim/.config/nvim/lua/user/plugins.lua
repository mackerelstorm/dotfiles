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
	use {
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt= true }
	}

	-- Colorschemes
	use "tanvirtin/monokai.nvim"	
	use "folke/tokyonight.nvim"

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
	use "neovim/nvim-lspconfig"
	use "williamboman/nvim-lsp-installer"

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		commit = "d180118c5c4d200da928b65532fe4f67d10a6584",
		run = ":TSUpdate",
	}
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
