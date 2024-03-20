local status, null_ls = pcall(require, "null-ls")
if not status then
	vim.notify("没有找到 null-ls")
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = {
		-- Formatting ---------------------
		-- shfmt - bash
		formatting.shfmt,
		-- stylua - lua
		formatting.stylua,
		-- clangd - c/c++
		formatting.clang_format,
		-- black - python
		formatting.black.with({ extra_args = { "--fast" } }),
		-- prettier - json/css/javascript/typescript/vue
		formatting.prettier.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"json",
				"yaml",
				"graphql",
                "html",
				"markdown",
			},
			prefer_local = "node_modules/.bin",
		}),
	},
	-- #{m}: message
	-- #{s}: source name (defaults to null-ls if not specified)
	-- #{c}: code (if available)
	-- 提示格式： [eslint] xxx
	diagnostics_format = "[#{s}] #{m}",
	on_attach = function(client)
		-- 自定义 :Format 命令
		vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()']])
	end,
})
