vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.g.leetcode_browser = "chrome"

vim.opt.scrolloff = 8                           -- minimal number of screen lines to keep above and below the cursor

vim.g.XkbSwitchEnabled = 1
vim.g.XkbSwitchLib = '/usr/local/lib/libxkbswitch.so'

vim.cmd("set wrap!")

-- require("telescope").load_extension("hbac")
-- require("telescope").extensions.hbac.buffers()

require("custom.xkb_switch")
require("custom.dap")
