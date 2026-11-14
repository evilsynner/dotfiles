-- ============================================================
-- init.lua — entry point only. Real config lives in lua/core
-- (editor behaviour) and lua/plugins (one file per plugin).
--
--   lua/core/options.lua   → vim.opt settings
--   lua/core/autocmds.lua  → per-filetype indent, misc autocmds
--   lua/core/keymaps.lua   → keymaps that need no plugin
--   lua/core/runners.lua   → "run current file" table (add languages here)
--   lua/core/lazy.lua      → plugin manager bootstrap
--   lua/plugins/*.lua      → each plugin + its own keymaps
-- ============================================================

-- Leader must be set before lazy.nvim loads any plugin spec.
vim.g.mapleader      = " "
vim.g.maplocalleader = " "

require("core.options")
require("core.autocmds")
require("core.keymaps")
require("core.lazy")
