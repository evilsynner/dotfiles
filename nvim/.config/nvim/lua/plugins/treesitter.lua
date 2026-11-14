-- ============================================================
-- TREESITTER (main branch API)
-- On the main branch setup() no longer takes ensure_installed:
-- parsers are installed with install(). Add languages to `parsers`.
-- The main branch does not support lazy-loading.
-- ============================================================
local parsers = {
    "java", "python", "c", "lua", "bash",
    "json", "yaml", "toml", "html", "css",
    "markdown", "markdown_inline", "vim", "vimdoc", "query",
}

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy   = false,
    build  = ":TSUpdate",

    config = function()
        require("nvim-treesitter").install(parsers)

        -- Highlight every buffer that has a parser; skip files > 500 KB.
        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("user_treesitter", { clear = true }),
            callback = function(ev)
                local ok, stat = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(ev.buf))
                if ok and stat and stat.size > 500 * 1024 then return end
                pcall(vim.treesitter.start, ev.buf)
            end,
        })
    end,
}
