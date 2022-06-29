local nvim_lsp = require("lspconfig")
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then return end

local servers = {
    "clangd",
    "sumneko_lua",
    "pyright",
}

lsp_installer.setup {
    ensure_installed = servers
}

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup({
        on_attach = function(client)
            client.server_capabilities.document_formatting = false
			client.server_capabilities.document_range_formatting = false
        end,
        capabilities = capabilities,
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                },
            },
            clangd = {
                filetypes = {
                    "c", "h"
                },
                root_dir = {
                    nvim_lsp.util.root_pattern(
                        '.clangd',
                        '.clang-tidy',
                        '.clang-format',
                        'compile_commands.json',
                        'compile_flags.txt',
                        'configure.ac',
                        '.git'
                )},
            },
        },
    })
end
