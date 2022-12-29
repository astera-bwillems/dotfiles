local nvim_lsp = require("lspconfig")
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then return end

local navic = require("nvim-navic")

-- detect python venv
-- https://github.com/neovim/nvim-lspconfig/issues/500#issuecomment-851247107
local lsp_util = require("lspconfig.util")
local MY_FQBN = "arduino:samd:mkrzero"

local servers = {
    clangd = {
        cmd = {
          "clangd",
          "--background-index",
          "--suggest-missing-includes",
          "--clang-tidy",
          "--header-insertion=iwyu",
        },
        root_dir = function(fname)
            return lsp_util.root_pattern(
                '.clangd',
                '.clang-tidy',
                '.clang-format',
                'compile_commands.json',
                'compile_flags.txt',
                'configure.ac',
                '.git'
            )(fname)
        end
    },
    sumneko_lua = true,
    -- pylsp = {
    --     cmd = {
    --         "pylsp"
    --     },
    --     filetypes = {
    --         "python"
    --     },
    --     single_file_support = true,
    -- },
    yamlls = true,
    gopls = {
        cmd = {"gopls"},
        filetypes = { "go", "gomod", "gotmpl" },
        root_dir = lsp_util.root_pattern("go.mod", ".git"),
        single_file_support = true
    },
    pyright = {
        cmd = {
           "pyright-langserver", "--stdio"
        },
        filetypes = {"python"},
        workspace_folders = true,
        root_dir = lsp_util.root_pattern("pyrightconfig.json", "requirements.txt"),
        settings = {
           python = {

                  autoSearchPaths = true,
                  diagnosticMode = "workspace",
                  useLibraryCodeForTypes = true
            }
      }
    },
    marksman = {
        true
        -- cmd = { "marksman", "server" },
        -- filetypes = { "markdown" },
        -- root_dir = lsp_util.root_pattern(".git", ".marksman.toml"),
    },
    arduino_language_server = {
      cmd = {
        "arduino-language-server",
        "-cli-config", "/mnt/c/Users/BrandtWillems/AppData/Local/Arduino15/arduino-cli.yaml",
        "-fqbn", MY_FQBN,
        "-cli", "arduino-cli",
        "-clangd", "clangd"
      }
    }
}

lsp_installer.setup {
    ensure_installed = servers
}

-- Setup lspconfig.
local custom_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
    navic.attach(client, bufnr)
end

local custom_init = function(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end
-- local updated_capabilities = vim.lsp.protocol.make_client_capabilities()

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local setup_server = function(server, config)
  if not config then
    return
  end

  if type(config) ~= "table" then
    config = {}
  end

  config = vim.tbl_deep_extend("force", {
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = nil,
    },
  }, config)

  nvim_lsp[server].setup(config)
end

for server, config in pairs(servers) do
  setup_server(server, config)
end

-- for _, lsp in ipairs(servers) do
--     nvim_lsp[lsp].setup({
--         on_attach = function(client)
--             client.server_capabilities.document_formatting = false
-- 			client.server_capabilities.document_range_formatting = false
--         end,
--         before_init = function(_, config)
-- 			if lsp == "pyls" then
-- 				config.settings.python.pythonPath = get_python_path(config.root_dir)
-- 			end
-- 		end,
--         capabilities = capabilities,
--         settings = {
--             arduino = {
--               cmd = {
--                 "arduino-language-server",
--                 "-cli-config", "/mnt/c/Users/BrandtWillems/AppData/Local/Arduino15/arduino-cli.yaml",
--                 "-fqbn", MY_FQBN,
--                 "-cli", "arduino-cli",
--                 "-clangd", "clangd"
--               }
--             },
--             pyls = {
--                 cmd = {"pyls"},
--                 filestypes = {"python"},
--                 root_dir = function(fname)
--                     return util.path.dirname(fname)
--                 end,
--                 docs = {
--                     description = [[
--                         https://github.com/palantir/python-language-server
--                         `python-language-server`, a language server for Python.
--                     ]],
--
--                 },
--             },
--             Lua = {
--                 diagnostics = {
--                     globals = { 'vim' }
--                 },
--             },
--             clangd = {
--                 cmd = {"clangd", "--background-index"},
--                 filetypes = {
--                     "c", "h"
--                 },
--                 root_dir = {
--                     nvim_lsp.util.root_pattern(
--                         '.clangd',
--                         '.clang-tidy',
--                         '.clang-format',
--                         'compile_commands.json',
--                         'compile_flags.txt',
--                         'configure.ac',
--                         '.git'
--                 )},
--             },
--         },
--     })
-- end
