-- ============================================================
-- AUTO PAIRS  (brackets, quotes, etc.)
-- check_ts = true  makes it aware of Treesitter context so it
-- won't add a closing bracket inside a string or comment.
-- ============================================================
return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",

        config = function()
            require("nvim-autopairs").setup({
                check_ts = true,
            })
        end,
    },
}
