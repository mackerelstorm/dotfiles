local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local lspconfig = require("lspconfig")
lsp_installer.setup({})


local on_attach = require("user.lsp.handlers").on_attach
local capabilities = require("user.lsp.handlers").capabilities


lspconfig.sumneko_lua.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = require("user.lsp.settings.sumneko_lua")
})
