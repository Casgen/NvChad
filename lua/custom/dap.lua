local dap = require "dap"
local dap_install = require "dap-install"
local dapui = require "dapui"

dap_install.setup()
-- add other configs here

dapui.setup {
  expand_lines = true,
  icons = { expanded = "", collapsed = "", circular = "" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.33 },
        { id = "breakpoints", size = 0.17 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 },
      },
      size = 0.25,
      position = "right",
    },
    {
      elements = {
        { id = "repl", size = 0.50 },
        { id = "console", size = 0.50 },
      },
      size = 0.25,
      position = "bottom",
    },
  },
  floating = {
    max_height = 0.9,
    max_width = 0.5, -- Floats will be treated as percentage of your screen.
    border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
}

dap.adapters.dart = {
  type = "executable",
  command = "flutter",
  args = { "debug_adapter" },
}

-- Don't forget to install the codelldb-vscode through Mason! (it is names just "codelldb")
dap.adapters.cppdbg = {
  type = "executable",
  command = "/home/oem/.local/share/nvim/mason/bin/OpenDebugAD7",
  id = "cppdbg",
}

dap.configurations.cpp = {
  -- {
  --     name = "(gdb) Launch",
  --     type = "cppdbg",
  --     request = "launch",
  --     program =  "${workspaceFolder}/ECSImplementation/bin/Debug/ECSImplementation",
  --     args = {},
  --     stopAtEntry = false,
  --     cwd = "${fileDirname}",
  --     environment = {},
  --     MIMode =  "gdb",
  --     setupCommands =  {
  --         {
  --             description = "Enable pretty-printing for gdb",
  --             text = "-enable-pretty-printing",
  --             ignoreFailures = true
  --         },
  --         {
  --             description = "Set Disassembly Flavor to Intel",
  --             text = "-gdb-set disassembly-flavor intel",
  --             ignoreFailures = true
  --         }
  --     },
  -- },
  {
    name = "(gdb) Launch",
    type = "cppdbg",
    request = "launch",
    program = "${workspaceFolder}/bin/Debug-linux-x86_64/MeshAndTaskShaders/MeshAndTaskShaders",
    args = {},
    stopAtEntry = false,
    cwd = "${workspaceFolder}",
    environment = {},
    MIMode = "gdb",
    preLaunchTask = "./BuildAndCompile.sh",
    setupCommands = {
      {
        description = "Enable pretty-printing for gdb",
        text = "-enable-pretty-printing",
        ignoreFailures = true,
      },
      {
        description = "Set Disassembly Flavor to Intel",
        text = "-gdb-set disassembly-flavor intel",
        ignoreFailures = true,
      },
    },
  },
}

dap.configurations.dart = {
  {
    type = "dart",
    request = "launch",
    name = "Launch Flutter program",
    program = "lib/main.dart",
    cwd = "${workspaceFolder}",
  },
}

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.after.event_terminated["dapui_config"] = function()
  dapui.close()
  vim.cmd ":lua require'dap'.close()"
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dap.listeners.after.event_exited["dapui_config"] = function()
  vim.cmd ":lua require'dap'.close()"
end
