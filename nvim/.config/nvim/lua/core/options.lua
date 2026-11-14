-- ============================================================
-- OPTIONS
-- ============================================================
local opt = vim.opt

-- Search
opt.ignorecase = true
opt.smartcase  = true      -- case-sensitive as soon as you type a capital
opt.hlsearch   = true
opt.incsearch  = true
opt.showmatch  = true

-- Indentation (default 4; per-filetype overrides in autocmds.lua)
opt.tabstop     = 4
opt.softtabstop = 4
opt.shiftwidth  = 4
opt.expandtab   = true
opt.autoindent  = true

-- UI
opt.number         = true
opt.relativenumber = true
opt.colorcolumn    = "80"
opt.cursorline     = false
opt.wrap           = false
opt.termguicolors  = true
opt.signcolumn     = "yes"  -- stops text jumping when diagnostics appear
opt.scrolloff      = 4
opt.wildmode       = "longest,list"

-- Splits open where you expect
opt.splitbelow = true
opt.splitright = true

-- Behaviour
opt.mouse     = "a"
opt.clipboard = "unnamedplus" -- uses xclip/wl-copy on PC, termux-clipboard-* on Termux
opt.swapfile  = false
opt.spell     = false
opt.updatetime = 250
opt.timeoutlen = 400

-- vim.cmd.colorscheme("industry")
