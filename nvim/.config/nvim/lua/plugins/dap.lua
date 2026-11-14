-- ============================================================
-- DEBUGGER (nvim-dap + dap-ui) — generic, works for any
-- language that has an adapter (Java's comes from nvim-java).
-- ============================================================
local function dap(fn) return function() require("dap")[fn]() end end

return {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    keys = {
        { "<leader>dd", dap("continue"),          desc = "Start / continue" },
        { "<leader>db", dap("toggle_breakpoint"), desc = "Toggle breakpoint" },
        { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Condition: ")) end,
          desc = "Conditional breakpoint" },
        { "<leader>do", dap("step_over"),  desc = "Step over" },
        { "<leader>di", dap("step_into"),  desc = "Step into" },
        { "<leader>dO", dap("step_out"),   desc = "Step out" },
        { "<leader>dq", dap("terminate"),  desc = "Stop session" },
        { "<leader>du", function() require("dapui").toggle() end, desc = "Toggle UI" },
    },

    config = function()
        local d, ui = require("dap"), require("dapui")
        d.listeners.after.event_initialized.dapui_config = ui.open
        d.listeners.before.event_terminated.dapui_config = ui.close
        d.listeners.before.event_exited.dapui_config     = ui.close

        ui.setup({
            layouts = {
                { position = "left", size = 40, elements = {
                    { id = "scopes", size = 0.6 }, { id = "breakpoints", size = 0.2 }, { id = "stacks", size = 0.2 },
                } },
                { position = "bottom", size = 12, elements = {
                    { id = "repl", size = 0.5 }, { id = "console", size = 0.5 },
                } },
            },
        })
    end,
}
