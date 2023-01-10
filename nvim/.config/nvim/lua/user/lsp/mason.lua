local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local lspconfig = require("lspconfig")
local config_ok, masonconfig = pcall(require, "mason-lspconfig")
if not config_ok then
    return
end
mason.setup({})
masonconfig.setup({})


local on_attach = require("user.lsp.handlers").on_attach
local capabilities = require("user.lsp.handlers").capabilities


lspconfig.sumneko_lua.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = require("user.lsp.settings.sumneko_lua")
})

lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.tsserver.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
lspconfig.astro.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
