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
	-- 插件列表
	-- 主题
	{ "folke/tokyonight.nvim" },
	{ "projekt0n/github-nvim-theme" },
	-- 颜色
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },
	-- 文件目录
	{ "kyazdani42/nvim-tree.lua", dependencies = "kyazdani42/nvim-web-devicons" },
	-- 上下栏
	{ "akinsho/bufferline.nvim", dependencies = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } },
	{ "nvim-lualine/lualine.nvim", dependencies = { "kyazdani42/nvim-web-devicons" } },
	{ "arkav/lualine-lsp-progress" },
	-- 模糊查找
	{ "nvim-telescope/telescope.nvim", version = "0.1.5", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "LinArcX/telescope-env.nvim" },
	-- 开始界面
	{ "glepnir/dashboard-nvim" },
	-- 高亮
	{ "ahmedkhalf/project.nvim" },
	{ "nvim-treesitter/nvim-treesitter" },
	-- indent-blankline
	{ "lukas-reineke/indent-blankline.nvim" },
	-- which key
	{ "folke/which-key.nvim" },
	-- 消息栏
	{ "rcarriga/nvim-notify" },
	-- 括号补全
	{ "windwp/nvim-autopairs" },
	-- 高效移动
	{ "ggandor/leap.nvim" },
	-- Copilot
	-- { "github/copilot.vim" },
	-- Wakatime
	{ "wakatime/vim-wakatime", lazy = false },
	-- Surround
	{ "kylechui/nvim-surround" },
	-- 代码注释
	{ "numToStr/Comment.nvim" },
	-- live-server
	{
		"aurum77/live-server.nvim",
		build = function()
			require("live_server.util").install()
		end,
		cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
	},
	-- LSP
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	-- 补全
	-- 补全引擎
	{ "hrsh7th/nvim-cmp" },
	-- snippet 引擎
	{ "hrsh7th/vim-vsnip" },
	-- 补全源
	{ "hrsh7th/cmp-vsnip" },
	{ "hrsh7th/cmp-nvim-lsp" }, -- { name = nvim_lsp }
	{ "hrsh7th/cmp-buffer" }, -- { name = 'buffer' }
	{ "hrsh7th/cmp-path" }, -- { name = 'path' }
	{ "hrsh7th/cmp-cmdline" }, -- { name = 'cmdline' }
	-- 常见编程语言代码段
	{ "rafamadriz/friendly-snippets" },
	-- 格式化
	{ "nvimtools/none-ls.nvim" },
	-- UI
	{ "onsails/lspkind-nvim" },
	{ "kkharji/lspsaga.nvim" },
	-- json增强
	{ "b0o/schemastore.nvim" },
	-- typescript增强
	{ "jose-elias-alvarez/nvim-lsp-ts-utils", dependencies = "nvim-lua/plenary.nvim" },
    -- OSC支持
    { "ojroques/nvim-osc52" },
	-- DAP
	-- { "mfussenegger/nvim-dap" },
	-- { "theHamsta/nvim-dap-virtual-text" },
	-- { "rcarriga/nvim-dap-ui" },
	-- { "mfussenegger/nvim-dap-python" },
})

-- 加载插件
require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
require("plugin-config.indent-blankline")
require("plugin-config.nvim-autopairs")
require("plugin-config.nvim-surround")
require("plugin-config.leap")
require("plugin-config.which-key")
require("plugin-config.comment")
require("plugin-config.nvim-notify")
require("plugin-config.copilot")
require("plugin-config.live-server")
require("plugin-config.gruvbox")
require("plugin-config.tokyonight")
