-- ============================================================
-- CORE KEYMAPS (no plugin needed)
-- Plugin keymaps live next to their plugin in lua/plugins/.
-- Split navigation (C-h/j/k/l) and resizing (M-h/j/k/l) are in
-- plugins/smart-splits.lua so they cross into kitty / tmux.
--
-- Leader groups (shown by which-key):
--   <leader>e  explorer     <leader>g  git        <leader>c  code/LSP
--   <leader>d  debug        <leader>j  java       <leader>r  run
--   <leader>f  find (fzf)
--   <leader>t  tabs
-- ============================================================
local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { desc = desc, silent = true })
end

map({ "n", "v" }, "<Space>", "<Nop>", "Leader")

-- Save / quit  (needs `stty -ixon` in your shell, see shell/terminal.sh)
map("n", "<C-s>", "<cmd>update<cr>",        "Save file")
map("i", "<C-s>", "<Esc><cmd>update<cr>gi", "Save file")
map("v", "<C-s>", "<Esc><cmd>update<cr>gv", "Save file")
map({ "n", "i", "v" }, "<C-q>", "<Esc><cmd>q<cr>", "Quit window")

map("n", "<Esc>", "<cmd>nohlsearch<cr>", "Clear search highlight")

-- Neovim tabs
map("n", "<S-h>",      "<cmd>tabprevious<cr>", "Previous tab")
map("n", "<S-l>",      "<cmd>tabnext<cr>",     "Next tab")
map("n", "<leader>tn", "<cmd>tabnew<cr>",      "New tab")
map("n", "<leader>tc", "<cmd>tabclose<cr>",    "Close tab")

-- Run
local runners = require("core.runners")
map("n", "<leader>rr", runners.run_current,      "Run current file")
map("n", "<leader>rj", runners.java_compile_all, "Compile all Java files")

-- Leave terminal mode with Esc Esc (useful for the run split)
map("t", "<Esc><Esc>", [[<C-\><C-n>]], "Exit terminal mode")
