vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.scrolloff = 8                           -- minimal number of screen lines to keep above and below the cursor

vim.cmd("set wrap!")

require("custom.dap")
