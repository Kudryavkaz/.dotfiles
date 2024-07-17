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

require("lazy").setup({
	{ "folke/lazy.nvim" },
	-- 高效移动
	{ "ggandor/leap.nvim" },
	-- Surround
	{ "kylechui/nvim-surround" },
})

-- 加载插件
require("plugin-config.nvim-surround")
require("plugin-config.leap")
