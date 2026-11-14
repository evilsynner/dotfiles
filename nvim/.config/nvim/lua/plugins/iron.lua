-- ============================================================
-- IRON — send code from the editor to a REPL in a split.
--   <leader>io  open / close the REPL     <leader>iR  restart it
--   <leader>il  send line                 <leader>ip  send paragraph
--   <leader>is  send selection (visual) or motion (e.g. <leader>isip)
--   <leader>if  send whole file           <leader>iu  send up to cursor
--   <leader>ib  send "# %%" cell          <leader>in  send cell, go to next
--   <leader>ic  interrupt (Ctrl-C)        <leader>iq  quit REPL
--   <leader>ix  clear REPL
-- Split cells in a .py file with "# %%" lines, like a notebook.
-- To add another language, add it to repl_definition.
-- ============================================================
return {
    "Vigemus/iron.nvim",
    cmd  = { "IronRepl", "IronRestart", "IronFocus", "IronHide" },
    keys = {
        { "<leader>io", desc = "Open / close REPL" },
        { "<leader>il", desc = "Send line" },
        { "<leader>ip", desc = "Send paragraph" },
        { "<leader>is", mode = { "n", "v" }, desc = "Send motion / selection" },
        { "<leader>if", desc = "Send file" },
        { "<leader>ib", desc = "Send cell" },
        { "<leader>in", desc = "Send cell and move" },
    },

    config = function()
        local iron   = require("iron.core")
        local view   = require("iron.view")
        local common = require("iron.fts.common")

        -- Uses ipython when installed, plain python3 otherwise
        local python = vim.fn.executable("ipython") == 1
            and { "ipython", "--no-autoindent" } or { "python3" }

        iron.setup({
            config = {
                scratch_repl    = true,
                repl_definition = {
                    python = {
                        command        = python,
                        format         = common.bracketed_paste_python,
                        block_dividers = { "# %%", "#%%" },
                        env            = { PYTHON_BASIC_REPL = "1" }, -- needed for python 3.13+
                    },
                },
                -- Right side on wide screens, below on the phone
                repl_open_cmd = vim.o.columns > 120 and view.split.vertical.botright("%40")
                                                     or view.split.botright("%35"),
            },
            keymaps = {
                toggle_repl              = "<leader>io",
                restart_repl             = "<leader>iR",
                send_line                = "<leader>il",
                send_paragraph           = "<leader>ip",
                send_motion              = "<leader>is",
                visual_send              = "<leader>is",
                send_file                = "<leader>if",
                send_until_cursor        = "<leader>iu",
                send_code_block          = "<leader>ib",
                send_code_block_and_move = "<leader>in",
                interrupt                = "<leader>ic",
                exit                     = "<leader>iq",
                clear                    = "<leader>ix",
            },
            highlight          = { italic = true },
            ignore_blank_lines = true,
        })
    end,
}
