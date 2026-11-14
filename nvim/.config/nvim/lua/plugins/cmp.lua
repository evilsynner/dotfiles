-- ============================================================
-- COMPLETION  (nvim-cmp)
-- All cmp configuration lives here so lazy can guarantee
-- the plugin is loaded before setup() is called.
-- ============================================================
return {
    {
        "hrsh7th/nvim-cmp",

        dependencies = {
            "windwp/nvim-autopairs",    -- bracket integration
            "hrsh7th/cmp-nvim-lsp",     -- LSP completions
            "hrsh7th/cmp-buffer",       -- words from open buffers
            "hrsh7th/cmp-path",         -- filesystem paths
            "L3MON4D3/LuaSnip",         -- snippet engine
            "saadparwaiz1/cmp_luasnip", -- snippet source for cmp
        },

        config = function()
            local cmp         = require("cmp")
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")

            -- Close brackets automatically when confirming a completion
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },

                mapping = cmp.mapping.preset.insert({
                    -- Manually trigger the completion menu
                    ["<C-Space>"] = cmp.mapping.complete(),

                    -- Navigate the completion menu
                    ["<C-j>"]     = cmp.mapping.select_next_item(),
                    ["<C-k>"]     = cmp.mapping.select_prev_item(),

                    -- Confirm the selected completion
                    ["<CR>"]      = cmp.mapping.confirm({ select = true }),
                }),

                sources = cmp.config.sources({
                    { name = "nvim_lsp" }, -- highest priority: LSP
                    { name = "luasnip"  }, -- then snippets
                    { name = "buffer"   }, -- then words in buffer
                    { name = "path"     }, -- then filesystem paths
                }),
            })
        end,
    },
}
