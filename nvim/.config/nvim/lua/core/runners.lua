-- ============================================================
-- RUN CURRENT FILE  (<leader>rr)
-- One entry per filetype. Placeholders:
--   {file} full path   {dir} file's directory
--   {name} name without extension   {bin} full path without extension
-- To add a language, add one line to `runners`.
-- ============================================================
local M = {}

M.runners = {
    python     = "python3 {file}",
    c          = "gcc {file} -o {bin} && {bin}",
    cpp        = "g++ {file} -o {bin} && {bin}",
    java       = "cd {dir} && javac {file} && java {name}",
    lua        = "lua {file}",
    sh         = "bash {file}",
    javascript = "node {file}",
}

local function expand(cmd)
    local subs = {
        file = vim.fn.expand("%:p"),
        dir  = vim.fn.expand("%:p:h"),
        name = vim.fn.expand("%:t:r"),
        bin  = vim.fn.expand("%:p:r"),
    }
    return (cmd:gsub("{(%w+)}", function(k) return vim.fn.shellescape(subs[k]) end))
end

local function in_split(cmd)
    vim.cmd("update")
    vim.cmd("botright split | resize 12 | terminal " .. cmd)
    vim.cmd("startinsert")
end

function M.run_current()
    local cmd = M.runners[vim.bo.filetype]
    if not cmd then
        vim.notify("No runner for filetype '" .. vim.bo.filetype .. "' (see core/runners.lua)", vim.log.levels.WARN)
        return
    end
    in_split(expand(cmd))
end

-- Compile every .java file under the cwd
function M.java_compile_all()
    in_split([[find . -name "*.java" -print0 | xargs -0 javac]])
end

return M
