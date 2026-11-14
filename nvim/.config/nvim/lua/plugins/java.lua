-- ============================================================
-- NVIM-JAVA — jdtls, debug adapter and test runner, wired
-- automatically. Loads only for Java buffers; the keymaps below
-- also exist only in Java buffers (ft = "java").
-- Debugging keys (<leader>d…) come from plugins/dap.lua.
-- ============================================================
local function cmd(c) return "<cmd>" .. c .. "<cr>" end
local function refactor(fn) return function() require("java").refactor[fn]() end end

return {
    "nvim-java/nvim-java",
    ft = "java",
    dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui", "MunifTanjim/nui.nvim" },

    keys = {
        -- run / build
        { "<leader>jr", cmd("JavaRunnerRunMain"),        ft = "java", desc = "Run main class" },
        { "<leader>js", cmd("JavaRunnerStopMain"),       ft = "java", desc = "Stop app" },
        { "<leader>jl", cmd("JavaRunnerToggleLogs"),     ft = "java", desc = "Toggle runner logs" },
        { "<leader>jb", cmd("JavaBuildBuildWorkspace"),  ft = "java", desc = "Build workspace" },
        { "<leader>jc", cmd("JavaBuildCleanWorkspace"),  ft = "java", desc = "Clean workspace" },
        { "<leader>jv", cmd("JavaSettingsChangeRuntime"), ft = "java", desc = "Change JDK" },
        -- tests
        { "<leader>jtc", cmd("JavaTestRunCurrentClass"),    ft = "java", desc = "Run test class" },
        { "<leader>jtm", cmd("JavaTestRunCurrentMethod"),   ft = "java", desc = "Run test method" },
        { "<leader>jta", cmd("JavaTestRunAllTests"),        ft = "java", desc = "Run all tests" },
        { "<leader>jtr", cmd("JavaTestViewLastReport"),     ft = "java", desc = "Last test report" },
        { "<leader>jtd", cmd("JavaTestDebugCurrentClass"),  ft = "java", desc = "Debug test class" },
        { "<leader>jtD", cmd("JavaTestDebugCurrentMethod"), ft = "java", desc = "Debug test method" },
        -- refactor (extract)
        { "<leader>jxm", refactor("extract_method"),   mode = { "n", "v" }, ft = "java", desc = "Extract method" },
        { "<leader>jxv", refactor("extract_variable"), mode = { "n", "v" }, ft = "java", desc = "Extract variable" },
        { "<leader>jxc", refactor("extract_constant"), mode = { "n", "v" }, ft = "java", desc = "Extract constant" },
    },

    config = function()
        require("java").setup()
        vim.lsp.enable("jdtls")
    end,
}
