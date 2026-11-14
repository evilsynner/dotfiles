-- ============================================================
-- SMART-SPLITS (v3) — one set of keys for Neovim splits, kitty
-- windows and tmux panes. At the edge of Neovim the same key
-- keeps going into the neighbouring kitty window / tmux pane.
--
--   C-h/j/k/l   move     (same in kitty and tmux)
--   M-h/j/k/l   resize   (same in kitty and tmux)
--   <leader>wh/j/k/l  swap buffer with neighbouring split
--
-- v3 ships no terminal support itself: tmux and kitty each come
-- from a small "backend" plugin below. tmux is listed first, so
-- inside tmux (phone, or tmux in kitty) tmux panes are used;
-- otherwise kitty windows.
--
-- Must NOT be lazy-loaded: it tells kitty/tmux "nvim is here".
-- ============================================================
local has_kitty = vim.fn.executable("kitty") == 1

return {
    "smart-splits-nvim/smart-splits.nvim",
    version = "^3.0.0",
    lazy    = false,

    dependencies = {
        { "smart-splits-nvim/backend-tmux", main = "smart-splits-backend-tmux" },
        {
            "smart-splits-nvim/backend-kitty",
            main  = "smart-splits-backend-kitty",
            -- Copies relative_resize.py into ~/.config/kitty (used by
            -- Alt-h/j/k/l in kitty). Skipped on Termux: no kitty there.
            build = has_kitty and "./kitten/install_relative_resize.lua" or nil,
        },
    },

    config = function()
        local ss = require("smart-splits")
        ss.setup({
            mux    = { backend = { "smart-splits-backend-tmux", "smart-splits-backend-kitty" } },
            move   = { at_edge = "stop" },  -- keep in sync with tmux/conf.d/20-keys.conf
            resize = { amount = 3 },
        })

        local map = function(lhs, fn, desc) vim.keymap.set("n", lhs, fn, { desc = desc }) end
        map("<C-h>", ss.move_cursor_left,  "Focus left")
        map("<C-j>", ss.move_cursor_down,  "Focus down")
        map("<C-k>", ss.move_cursor_up,    "Focus up")
        map("<C-l>", ss.move_cursor_right, "Focus right")

        map("<M-h>", ss.resize_left,  "Resize left")
        map("<M-j>", ss.resize_down,  "Resize down")
        map("<M-k>", ss.resize_up,    "Resize up")
        map("<M-l>", ss.resize_right, "Resize right")

        map("<leader>wh", ss.swap_buf_left,  "Swap buffer left")
        map("<leader>wj", ss.swap_buf_down,  "Swap buffer down")
        map("<leader>wk", ss.swap_buf_up,    "Swap buffer up")
        map("<leader>wl", ss.swap_buf_right, "Swap buffer right")
    end,
}
