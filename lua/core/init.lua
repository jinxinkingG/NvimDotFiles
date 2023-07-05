-- change startup folder
vim.cmd[[
augroup cdpwd
    autocmd!
    autocmd VimEnter * cd C:\Users\jinxin\AppData\Local\nvim 
augroup END
]]
-- load lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
--load global funtions
require("core.functions")
