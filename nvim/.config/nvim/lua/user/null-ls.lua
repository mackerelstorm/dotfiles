local status_ok, nullls = pcall(require, "null-ls")
if not status_ok then
    return
end

local formatting = nullls.builtins.formatting
local diagnostics = nullls.builtins.diagnostics
nullls.setup ({
        sources = {
            formatting.prettierd,
            diagnostics.eslint_d,
            formatting.rustfmt,
            formatting.gofmt,
        },
    on_attach = function (client)
        if client.server_capabilities.documentFormattingProvider then
            vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format({bufnr = bufnr, filter=function(client) return client.name == 'null-ls' end})")
        end
    end
    })
