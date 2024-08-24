-- 设置leaderkey
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- 本地变量
local map = vim.keymap.set
local opt = { noremap = true, silent = true }

-- 基本快捷键
map("n", "<leader>a", "ggVG", opt)
map({ "n", "i", "v" }, "<F1>", "", opt)
-- 在浏览器中打开
map("n", "<leader>ob", ":silent !xdg-open %<CR>", opt)
-- 在vscode中打开
map("n", "<leader>ov", ":silent !code %<CR>", opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)


-- 上下滚动浏览
map("n", "<C-j>", "20j", opt)
map("n", "<C-k>", "20k", opt)
map("v", "<C-j>", "20j", opt)
map("v", "<C-k>", "20k", opt)
-- ctrl u / ctrl + d  只移动25行，默认移动半屏
map("n", "<C-u>", "25k", opt)
map("n", "<C-d>", "25j", opt)

-- 在visual 模式里粘贴不要复制
map("v", "p", '"_dP', opt)

-- insert 模式下，跳到行首行尾
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)

-- 复制当前文件路径
map("n", "<leader>pwd", ":silent !echo %:p <Bar> wl-copy<CR>", opt)

-- x删除不复制
map("n", "x", "\"_x", opt)

-- vscode配置
-- 窗口管理
map("n", "<C-A-w>", "<CMD>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>", opt)    -- 关闭窗口
map("n", "<C-h>", "<CMD>call VSCodeNotify('workbench.action.previousEditor')<CR>", opt)    -- 左侧窗口
map("n", "<C-l>", "<CMD>call VSCodeNotify('workbench.action.nextEditor')<CR>", opt)    -- 左侧窗口
map("n", "<A-h>", "<CMD>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>", opt)    -- 左侧窗口
map("n", "<A-l>", "<CMD>call VSCodeNotify('workbench.action.focusRightGroup')<CR>", opt)    -- 左侧窗口

-- 格式化
map("n", "<leader>f", "<CMD>call VSCodeNotify('editor.action.formatDocument')<CR>", opt)
