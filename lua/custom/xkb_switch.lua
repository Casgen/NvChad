local switch_keyboard_layout = function()
    vim.schedule(function()
        os.execute "xkb-switch -n"
    end)
end

vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = { "*.tex" },
    callback = switch_keyboard_layout,
})

vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = { "*.tex" },
    callback = switch_keyboard_layout,
})
