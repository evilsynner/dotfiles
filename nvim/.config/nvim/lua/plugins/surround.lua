-- ============================================================
-- NVIM-SURROUND — add / change / delete quotes, brackets, tags.
--   ysiw)   wrap word in ( )        ys$"   wrap to end of line in " "
--   cs"'    change " " to ' '       ds(    delete surrounding ( )
--   S"      (visual mode) wrap the selection in " "
-- Opening bracket adds spaces: ysiw( → ( word ), ysiw) → (word)
-- ============================================================
return {
    "kylechui/nvim-surround",
    version = "*",
    event   = "VeryLazy",
    opts    = {},
}
