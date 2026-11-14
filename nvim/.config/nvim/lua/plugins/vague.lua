return {
  {
    "vague-theme/vague.nvim",
    lazy = false,    -- Load immediately on startup
    priority = 1000, -- Load before all other start plugins
    opts = {
      -- Optional configuration goes here, for example:
      -- transparent = false,
      -- on_highlights = function(hl, colors)
      --   hl.Comment = { fg = colors.comment, italic = true }
      -- end,
    },
    config = function(_, opts)
      require("vague").setup(opts)
      vim.cmd.colorscheme("vague")
    end,
  },
}
