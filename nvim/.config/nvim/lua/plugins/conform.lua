-- ============================================================
-- CONFORM — formatting. Add a filetype → formatter line to
-- `formatters_by_ft`. Files without one fall back to the LSP.
-- ============================================================
return {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd   = "ConformInfo",
    keys  = {
        { "<leader>cf", function() require("conform").format({ async = true, lsp_format = "fallback" }) end,
          mode = { "n", "v" }, desc = "Format buffer" },
    },
    opts = {
        formatters_by_ft = {
            c = { "clang_format" },
        },
        format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
    },
}
