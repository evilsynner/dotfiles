-- ============================================================
-- GITSIGNS — marks added / changed / deleted lines next to the
-- line numbers, and works on single changes ("hunks").
--   ]h / [h     next / previous change
--   <leader>gs  stage (or unstage) the change under the cursor
--   <leader>gr  undo the change under the cursor
--   <leader>gp  preview the change in a popup
--   <leader>gb  who changed this line (blame)
--   <leader>gd  diff the file against the last commit
--   ih          select the change as a text object (e.g. dih, yih)
-- Keymaps only exist in files tracked by git.
-- ============================================================
return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        on_attach = function(buf)
            local gs = require("gitsigns")
            local map = function(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
            end

            map("n", "]h", function() gs.nav_hunk("next") end, "Next change")
            map("n", "[h", function() gs.nav_hunk("prev") end, "Previous change")

            map("n", "<leader>gs", gs.stage_hunk,   "Stage / unstage change")
            map("n", "<leader>gr", gs.reset_hunk,   "Undo change")
            map("v", "<leader>gs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage selection")
            map("v", "<leader>gr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Undo selection")
            map("n", "<leader>gS", gs.stage_buffer, "Stage whole file")
            map("n", "<leader>gp", gs.preview_hunk, "Preview change")
            map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame line")
            map("n", "<leader>gd", gs.diffthis,     "Diff against last commit")

            map({ "o", "x" }, "ih", gs.select_hunk, "Select change")
        end,
    },
}
