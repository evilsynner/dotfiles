-- ============================================================
-- LAZYGIT — git UI in a float. Needs the `lazygit` binary
-- (Termux: pkg install lazygit).
-- ============================================================
return {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd  = { "LazyGit", "LazyGitCurrentFile" },
    keys = {
        { "<leader>gg", "<cmd>LazyGit<cr>",            desc = "LazyGit" },
        { "<leader>gf", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit: current file log" },
    },
    init = function()
        vim.g.lazygit_floating_window_winblend        = 0
        vim.g.lazygit_floating_window_scaling_factor  = 0.9
        vim.g.lazygit_floating_window_border_chars    = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
        vim.g.lazygit_floating_window_use_plenary     = 1
    end,
}
