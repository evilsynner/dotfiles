-- ============================================================
-- INDENT-BLANKLINE  (indentation guides)
-- Draws vertical lines at each indentation level.
-- The current scope's line is highlighted in a distinct color
-- so you always know which block your cursor is inside.
--
-- Rainbow colors: each nesting level gets its own color,
-- making deeply nested code much easier to read visually.
-- ============================================================
return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPre", "BufNewFile" },   -- load when a file opens

    config = function()
        local hooks = require("ibl.hooks")

        -- ── Rainbow highlight groups ──────────────────────────
        -- One color per indentation level, cycling through all 7.
        -- These are registered in a HIGHLIGHT_SETUP hook so they
        -- survive colorscheme changes automatically.
        local rainbow = {
            "IblRainbow1",
            "IblRainbow2",
            "IblRainbow3",
            "IblRainbow4",
            "IblRainbow5",
            "IblRainbow6",
            "IblRainbow7",
        }

        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "IblRainbow1", { fg = "#E06C75" }) -- red
            vim.api.nvim_set_hl(0, "IblRainbow2", { fg = "#E5C07B" }) -- yellow
            vim.api.nvim_set_hl(0, "IblRainbow3", { fg = "#61AFEF" }) -- blue
            vim.api.nvim_set_hl(0, "IblRainbow4", { fg = "#D19A66" }) -- orange
            vim.api.nvim_set_hl(0, "IblRainbow5", { fg = "#98C379" }) -- green
            vim.api.nvim_set_hl(0, "IblRainbow6", { fg = "#C678DD" }) -- violet
            vim.api.nvim_set_hl(0, "IblRainbow7", { fg = "#56B6C2" }) -- cyan
        end)

        require("ibl").setup({

            -- ── Indent lines ─────────────────────────────────
            indent = {
                char      = "│",          -- solid vertical bar (you can try "▏" for thinner)
                highlight = rainbow,      -- cycle through rainbow colors per level
            },

            -- ── Scope ────────────────────────────────────────
            -- Underlines the first and last line of the block
            -- your cursor is currently inside (function, if, loop…)
            scope = {
                enabled    = true,
                show_start = true,        -- underline on the opening line
                show_end   = true,        -- underline on the closing line
                highlight  = rainbow,     -- scope line matches its level's color
            },

            -- ── Excluded file types ───────────────────────────
            -- Don't draw indent lines in these buffers where they
            -- would just add visual noise.
            exclude = {
                filetypes = {
                    "help",
                    "terminal",
                    "lazy",
                    "mason",
                    "neo-tree",
                    "toggleterm",
                    "TelescopePrompt",
                },
                buftypes = {
                    "terminal",
                    "nofile",
                },
            },
        })
    end,
}
