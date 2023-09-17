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
    { "mg979/vim-visual-multi" },
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        lazy = true,
        cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install && git reset --hard",
    },
    {
        "epwalsh/obsidian.nvim",
        lazy = true,
        event = {
            "BufReadPre /media/oem/MoreStuff/ObsidianVault/MyVault/**.md",
            "BufNewFile /media/oem/MoreStuff/ObsidianVault/MyVault/**.md",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("obsidian").setup {
                dir = "/media/oem/MoreStuff/ObsidianVault/MyVault",
                notes_subdir = "Zettelkasten",
                completion = {
                    nvim_cmp = true,
                    min_chars = 2,
                    new_notes_location = "notes_subdir",
                },
                disable_frontmatter = true,
                templates = {
                    subdir = "Templates",
                    date_format = "%Y-%m-%d",
                    time_format = "%H:%M:%S",
                },
                mappings = {},
            }
        end,
    },
}

return plugins
