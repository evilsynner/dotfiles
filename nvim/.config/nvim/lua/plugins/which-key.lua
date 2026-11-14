-- ============================================================
-- WHICH-KEY — press <leader> and wait: shows every mapping.
-- Very handy on the phone, where you can't keep a cheatsheet open.
-- Group names below; the mappings themselves come from each
-- plugin's `desc`.
-- ============================================================
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "helix",
        spec = {
            { "<leader>c", group = "code / LSP" },
            { "<leader>d", group = "debug" },
            { "<leader>e", group = "explorer" },
            { "<leader>f", group = "find" },
            { "<leader>g", group = "git" },
            { "<leader>j", group = "java" },
            { "<leader>jt", group = "java tests" },
            { "<leader>jx", group = "java extract" },
            { "<leader>r", group = "run" },
            { "<leader>t", group = "tabs" },
            { "<leader>w", group = "windows" },
        },
    },
}
