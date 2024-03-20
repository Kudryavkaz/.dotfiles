-- 设置leaderkey
vim.g.mapleader = ","
vim.g.maplocalleader = ","
-- 本地变量
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- 基本快捷键
map("n", "<C-a>", "ggVG", opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 上下滚动浏览
map("n", "<C-j>", "20j", opt)
map("n", "<C-k>", "20k", opt)
-- ctrl u / ctrl + d  只移动25行，默认移动半屏
map("n", "<C-u>", "25k", opt)
map("n", "<C-d>", "25j", opt)

-- 在visual 模式里粘贴不要复制
map("v", "p", '"_dP', opt)

-- insert 模式下，跳到行首行尾
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)
