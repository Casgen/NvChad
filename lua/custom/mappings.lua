local M = {}

M.clangd = {
  n = {
      ["<leader>cs"] = {"<cmd> ClangdSwitchSourceHeader <CR>", "Switch between header and source file"  }
  }
}

M.custom = {
  v = {
    ["p"] = {'"_dP', "Better paste"},
    ["<"] = {"<gv", "Tab right and Stay in indent mode"},
    [">"] = {">gv", "Tab left and Stay in indent mode"},
  },
  n = {
    ["<C-Up>"] = { "<cmd>resize -2<CR>", "Resize window upwards" },
    ["<C-Down>"] = { "<cmd>resize +2<CR>", "Resize window downwards" },
    ["<C-Left>"] = { "<cmd>vertical resize -2<CR>", "Resize window towards left" },
    ["<C-Right>"] = { "<cmd>vertical resize +2<CR>", "Resize window towards right" },
    ["<leader>nh"] = {"<cmd>nohlsearch<CR>", "Clears highlights"},
    ["<leader>o"] = {"o<Esc>", "Inserts new line below"},
    ["<leader>O"] = {"O<Esc>", "Inserts new line above"}
  }
}

M.dap = {
  n = {
    ["<leader>db"] = {"<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle breakpoint"},
    ["<leader>dc"] = {"<cmd>lua require'dap'.continue()<CR>", "Continue"},
    ["<leader>di"] = {"<cmd>lua require'dap'.step_into()<CR>", "Step into"},
    ["<leader>do"] = {"<cmd>lua require'dap'.step_over()<CR>", "Step over"},
    ["<leader>dO"] = {"<cmd>lua require'dap'.step_out()<CR>", "Step out"},
    ["<leader>dr"] = {"<cmd>lua require'dap'.repl.toggle()<CR>", "Repl toggle"},
    ["<leader>dl"] = {"<cmd>lua require'dap'.run_last()<CR>", "Run last"},
    ["<leader>du"] = {"<cmd>lua require'dapui'.toggle()<CR>", "Toggle"},
    ["<leader>dt"] = {"<cmd>lua require'dap'.terminate()<CR>", "Terminate"},
    ["<leader>dC"] = {"<cmd>lua require'dap'.close()<CR> <cmd>lua require'dapui'.close()<CR>", "Force close session and UI"},
    ["<leader>dx"] = {"<cmd>lua require'dapui'.close()<CR>", "Close DAP ui"},
    ["<leader>dh"] = {"<cmd>lua require'dap.ui.widgets'.hover()<CR>", "Hover"},
    ["<leader>dp"] = {"<cmd>lua require'dap.ui.widgets'.preview()<CR>", "Preview"},
    ["<leader>df"] = {"<cmd>lua require'dap.ui.widgets'.float()<CR>", "Centered Float (Frames)"},
  }
}

M.obsidian = {
    n = {
        ["<leader>on"] = {"<cmd>ObsidianNew<CR>", "Create a new note"},
        ["<leader>ot"] = {"<cmd>ObsidianTemplate<CR>", "Insert a template into the note using telescope.nvim"},
        ["<leader>of"] = {"<cmd>ObsidianFollowLink<CR>", "Follow a note reference below the cursor"},
    }
}

M.markdown = {
    n = {
        ["<leader>mp"] = {"<cmd>MarkdownPreview<CR>", "Opens up a new browser tab and previews the markdown"},
        ["<leader>ms"] = {"<cmd>MarkdownStop<CR>", "Shuts down the browser tab with the preview"},
    }
}


return M
