-- ============================================================
-- LSP — servers + keymaps (keymaps only exist in buffers where
-- a server is attached). To add a language: install it with
-- :Mason and add its name to `servers`.
-- ============================================================
local servers = {
    "pyright",  -- Python
    "lua_ls",   -- Lua
    "bashls",   -- Bash
    "clangd",   -- C / C++
    -- jdtls is enabled by nvim-java (plugins/java.lua)
}

return {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },

    config = function()
        vim.lsp.config("*", {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })
        vim.lsp.enable(servers)

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("user_lsp_keys", { clear = true }),
            callback = function(ev)
                local map = function(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = "LSP: " .. desc })
                end
                local jump = function(n) return function() vim.diagnostic.jump({ count = n, float = true }) end end

                map("n", "gd", vim.lsp.buf.definition,  "Go to definition")
                map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
                map("n", "gr", vim.lsp.buf.references,  "References")
                map("n", "K",  vim.lsp.buf.hover,       "Hover")
                map("n", "]d", jump(1),  "Next diagnostic")
                map("n", "[d", jump(-1), "Previous diagnostic")

                map("n",          "<leader>cr", vim.lsp.buf.rename,        "Rename symbol")
                map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action,   "Code action")
                map("n",          "<leader>cd", vim.diagnostic.open_float, "Line diagnostic")
                map("n",          "<leader>cq", vim.diagnostic.setloclist, "Diagnostics list")
            end,
        })
    end,
}
