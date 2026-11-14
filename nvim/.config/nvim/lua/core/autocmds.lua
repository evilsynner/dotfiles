-- ============================================================
-- AUTOCMDS
-- ============================================================

-- Indent width per filetype. Anything not listed uses the
-- default from options.lua (4). To add a language, add a line.
local indent_by_ft = {
    lua        = 2,
    javascript = 2,
    typescript = 2,
    html       = 2,
    css        = 2,
    json       = 2,
    yaml       = 2,
}

local group = vim.api.nvim_create_augroup("user_config", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group    = group,
    pattern  = vim.tbl_keys(indent_by_ft),
    callback = function(ev)
        local size = indent_by_ft[ev.match]
        vim.opt_local.tabstop     = size
        vim.opt_local.softtabstop = size
        vim.opt_local.shiftwidth  = size
    end,
})

-- Briefly highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    group    = group,
    callback = function() vim.hl.on_yank({ timeout = 150 }) end,
})
