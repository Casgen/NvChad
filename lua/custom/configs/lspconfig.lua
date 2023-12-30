local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

lspconfig.clangd.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    log = "verbose"
}

lspconfig.pyright.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

lspconfig.rust_analyzer.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

local rt = require("rust-tools")

rt.setup({})
