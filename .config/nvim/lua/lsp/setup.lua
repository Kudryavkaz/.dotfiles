local status, mason = pcall(require, "mason")
if not status then
	vim.notify("没有找到 mason")
	return
end

local status, mason_config = pcall(require, "mason-lspconfig")
if not status then
	vim.notify("没有找到 mason-lspconfig")
	return
end

local status, lspconfig = pcall(require, "lspconfig")
if not status then
	vim.notify("没有找到 lspconfig")
	return
end

-- :h mason-default-settings
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
require("mason-lspconfig").setup({
	-- 确保安装，根据需要填写
	ensure_installed = {
		-- LSP
		"lua_ls",
		"clangd",
		"html",
		"cssls",
		"emmet_ls",
		"jsonls",
		"tsserver",
		"bashls",
		"pyright",
		"volar",
		-- -- Formatter
		-- "shfmt",
		-- "stylua",
		-- "clang-format",
		-- "black",
		-- "prettier",
		-- -- DAP
		-- "cpptools",
	},
})

-- 安装列表
-- { key: 服务器名， value: 配置文件 }
-- key 必须为下列网址列出的 server name，不可以随便写
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
	lua_ls = require("lsp.config.lua"),
	clangd = require("lsp.config.clangd"),
	html = require("lsp.config.html"),
	cssls = require("lsp.config.css"),
	emmet_ls = require("lsp.config.emmet"),
	jsonls = require("lsp.config.json"),
	tsserver = require("lsp.config.ts"),
	bashls = require("lsp.config.bash"),
	pyright = require("lsp.config.python"),
	volar = require("lsp.config.vue"),
}

for name, config in pairs(servers) do
	if config ~= nil and type(config) == "table" then
		-- 自定义初始化配置文件必须实现on_setup 方法
		config.on_setup(lspconfig[name])
	else
		-- 使用默认参数
		lspconfig[name].setup({})
	end
end

-- 启用ui
require("lsp.ui")
