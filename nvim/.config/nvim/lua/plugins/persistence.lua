-- ============================================================
-- PERSISTENCE — saves open files and splits per project folder
-- when you quit, and restores them on demand.
--   <leader>qs  restore the session for this folder
--   <leader>ql  restore the last session (any folder)
--   <leader>qS  pick a session from a list
--   <leader>qd  don't save a session when quitting this time
-- ============================================================
local function p(fn, opts)
    return function() require("persistence")[fn](opts) end
end

return {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts  = {},
    keys  = {
        { "<leader>qs", p("load"),                 desc = "Restore session (this folder)" },
        { "<leader>ql", p("load", { last = true }), desc = "Restore last session" },
        { "<leader>qS", p("select"),               desc = "Pick a session" },
        { "<leader>qd", p("stop"),                 desc = "Don't save this session" },
    },
}
