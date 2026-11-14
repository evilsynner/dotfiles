-- ============================================================
-- NEO-TREE  (file explorer)
--
-- Dependencies:
--   nvim-web-devicons  → file type icons (requires a Nerd Font)
--   nui.nvim           → UI components used by neo-tree
--   plenary.nvim       → Lua utility library used by neo-tree
-- ============================================================
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd    = "Neotree",
    keys   = {
        { "<leader>ee", "<cmd>Neotree toggle<cr>", desc = "Toggle explorer" },
        { "<leader>ef", "<cmd>Neotree reveal<cr>", desc = "Reveal current file" },
        { "<leader>eo", "<cmd>Neotree focus<cr>",  desc = "Focus explorer" },
    },

    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- file icons (needs a Nerd Font in your terminal)
        "MunifTanjim/nui.nvim",
    },

    config = function()
        require("neo-tree").setup({

            -- ── General ─────────────────────────────────────
            close_if_last_window = true,   -- auto-close if neo-tree is the only window left
            enable_git_status    = true,
            enable_diagnostics   = true,   -- shows LSP error/warning icons next to files

            -- ── Window ──────────────────────────────────────
            window = {
                position = "left",
                width    = 35,

                -- ── Keymaps inside the neo-tree window ──────
                -- These only work when focus is inside the tree.
                mappings = {
                    -- Navigation
                    ["<CR>"]  = "open",                        -- open file / expand folder
                    ["l"]     = "open",                        -- also open with 'l' (feels natural)
                    ["h"]     = "close_node",                  -- collapse folder with 'h'
                    ["P"]     = { "toggle_preview", config = { use_float = true } },

                    -- Open in splits
                    ["s"]     = "open_split",                  -- horizontal split
                    ["v"]     = "open_vsplit",                 -- vertical split
                    ["t"]     = "open_tabnew",                 -- new tab

                    -- File operations
                    ["a"]     = "add",                         -- create file (end with / for dir)
                    ["A"]     = "add_directory",               -- create directory
                    ["r"]     = "rename",                      -- rename
                    ["d"]     = "delete",                      -- delete (asks for confirmation)
                    ["c"]     = "copy",                        -- copy
                    ["m"]     = "move",                        -- move / cut
                    ["y"]     = "copy_to_clipboard",
                    ["x"]     = "cut_to_clipboard",
                    ["p"]     = "paste_from_clipboard",

                    -- Tree controls
                    ["R"]     = "refresh",                     -- refresh the tree
                    ["q"]     = "close_window",                -- close neo-tree
                    ["?"]     = "show_help",                   -- show all keymaps
                    ["<BS>"]  = "navigate_up",                 -- go to parent directory
                    ["."]     = "set_root",                    -- set current folder as root
                },
            },

            -- ── Filesystem source ────────────────────────────
            filesystem = {
                filtered_items = {
                    visible        = false,   -- hidden files are hidden by default …
                    hide_dotfiles  = true,
                    hide_gitignored = true,
                },
                follow_current_file = {
                    enabled = true,           -- auto-reveal the active file in the tree
                },
                use_libuv_file_watcher = true, -- auto-refresh when files change on disk
            },

            -- ── Icons ────────────────────────────────────────
            default_component_configs = {
                indent = {
                    indent_size        = 2,
                    with_expanders     = true,
                    expander_collapsed = "",
                    expander_expanded  = "",
                },
                icon = {
                    folder_closed = "",
                    folder_open   = "",
                    folder_empty  = "",
                },
                git_status = {
                    symbols = {
                        added     = "✚",
                        modified  = "",
                        deleted   = "✖",
                        renamed   = "➜",
                        untracked = "★",
                        ignored   = "◌",
                        unstaged  = "✗",
                        staged    = "✓",
                        conflict  = "",
                    },
                },
            },
        })
    end,
}
