local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
      local on_attach = require("plugins.configs.lspconfig").on_attach;
      local capabilities = require("plugins.configs.lspconfig").capabilities;


      require("lspconfig").clangd.setup{
        on_attach = on_attach,
        capabilities = capabilities
      }
    end,
  },
  { "christoomey/vim-tmux-navigator" },
  { "tpope/vim-fugitive" },
  { "jose-elias-alvarez/null-ls.nvim" },

  -- { "mfussenegger/nvim-dap" },
  -- { "jay-babu/mason-nvim-dap.nvim", requires = {"williamboman/mason.nvim"} , lazy = false, config = function()
  --     require("mason").setup()
  --     require("mason-nvim-dap").setup({
  --       automatic_installation = true,
  --       handlers = {
  --         function(config)
  --           require("mason-nvim-dap").default_setup(config)
  --         end,
  --         cppdbg = function(config)
  --           config.configurations.cpp = {
  --             {
  --                 name = "(gdb) Launch",
  --                 type = "cppdbg",
  --                 request = "launch",
  --                 program =  "${workspaceRoot}/ECSImplementation/bin/Debug/ECSImplementation",
  --                 args = {},
  --                 stopAtEntry = false,
  --                 cwd = "${fileDirname}",
  --                 environment = {},
  --                 externalConsole = false,
  --                 MIMode =  "gdb",
  --                 setupCommands =  {
  --                     {
  --                         description = "Enable pretty-printing for gdb",
  --                         text = "-enable-pretty-printing",
  --                         ignoreFailures = true
  --                     },
  --                     {
  --                         description = "Set Disassembly Flavor to Intel",
  --                         text = "-gdb-set disassembly-flavor intel",
  --                         ignoreFailures = true
  --                     }
  --                 },
  --             }
  --           }
  --         end
  --
  --       },
  --     })
  --   end
  -- },

  -- Old Nvim DAP
  { "mfussenegger/nvim-dap" },
  { "sakhnik/nvim-gdb" },
  { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap"} },
}

return plugins
