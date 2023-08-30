local plugins = {
  { "jose-elias-alvarez/null-ls.nvim" },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
    },
  },
  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
      local on_attach = require("plugins.configs.lspconfig").on_attach
      local capabilities = require("plugins.configs.lspconfig").capabilities

      require("lspconfig").clangd.setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      require("lspconfig").eslint.setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end,
  },
  {
    "alexghergh/nvim-tmux-navigation",
    lazy = false,
    config = function()
      local nvim_tmux_nav = require "nvim-tmux-navigation"

      nvim_tmux_nav.setup {
        disable_when_zoomed = true,
      }
    end,
  },
  { "tpope/vim-fugitive" },
  { "mfussenegger/nvim-dap" },
  { "sakhnik/nvim-gdb" },
  { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } },
}

return plugins
