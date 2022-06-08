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
        },
    on_attach = function (client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
        end
    end
    })
