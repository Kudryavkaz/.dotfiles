-- 基础配置
require("basic")
-- 插件管理
require("plugins")
-- 快捷键配置
require("keybindings")
-- 主题配置
require("colorscheme")
-- 自动设置
require("autocmds")
-- 内置LSP
require("lsp.setup")
-- 代码补全
require("cmp.setup")
-- 代码格式化
require("format.setup")
-- 运行代码
require("action")
-- neovide
if vim.g.neovide then
    require("neovide")
end
