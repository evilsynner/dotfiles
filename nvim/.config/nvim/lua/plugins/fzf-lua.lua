-- ============================================================
-- FZF-LUA — fuzzy finder (files, text, buffers…).
-- Needs the `fzf` binary; `ripgrep` and `fd` make it faster.
--   PC (Void):  sudo xbps-install -S fzf ripgrep fd
--   Termux:     pkg install fzf ripgrep fd
-- Inside the picker: C-j/C-k move, Enter open, C-v vsplit,
-- C-s split, C-t tab, Esc close.
-- ============================================================
local function fzf(cmd, opts)
    return function() require("fzf-lua")[cmd](opts) end
end

return {
    "ibhagwan/fzf-lua",
    cmd  = "FzfLua",
    keys = {
        { "<leader>ff", fzf("files"),            desc = "Find files" },
        { "<leader>fg", fzf("live_grep"),        desc = "Search text in project" },
        { "<leader>fw", fzf("grep_cword"),       desc = "Search word under cursor" },
        { "<leader>fw", fzf("grep_visual"),      desc = "Search selection", mode = "v" },
        { "<leader>fb", fzf("buffers"),          desc = "Open buffers" },
        { "<leader>fo", fzf("oldfiles"),         desc = "Recent files" },
        { "<leader>fh", fzf("helptags"),         desc = "Help pages" },
        { "<leader>fk", fzf("keymaps"),          desc = "Keymaps" },
        { "<leader>fd", fzf("diagnostics_document"), desc = "Diagnostics in file" },
        { "<leader>fs", fzf("lsp_document_symbols"), desc = "Symbols in file" },
        { "<leader>fr", fzf("resume"),           desc = "Resume last search" },
    },
    opts = {
        winopts = {
            height  = 0.85,
            width   = 0.85,
            preview = {
                -- Preview on the right on wide screens, below on narrow
                -- ones (the phone), switching at 120 columns.
                layout     = "flex",
                flip_columns = 120,
            },
        },
        keymap = {
            fzf = {
                ["ctrl-j"] = "down",
                ["ctrl-k"] = "up",
            },
        },
    },
}
