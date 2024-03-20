local status, wk = pcall(require, "which-key")
if not status then
	vim.notify("没有找到 which-key")
	return
end

wk.setup({
	wk.register({
		["<leader>s"] = {
			name = "窗口操作",
			["v"] = { "<cmd>vsp<CR>", "垂直分割" },
			["h"] = { "<cmd>sp<CR>", "水平分割" },
			["o"] = { "<C-w>o", "关闭其他" },
			["c"] = { "<C-w>c", "关闭当前" },
			[","] = { "<cmd>vertical resize -20<CR>", "左右缩小" },
			["."] = { "<cmd>vertical resize +20<CR>", "左右放大" },
			["j"] = { "<cmd>resize +8<CR>", "上下放大" },
			["k"] = { "<cmd>resize -8<CR>", "上下缩小" },
			["="] = { "<C-w>=", "等比例" },
		},
		["<leader>b"] = {
			name = "顶部标签页操作",
			["l"] = { ":BufferLineCloseRight<CR>", "关闭右侧" },
			["h"] = { ":BufferLineCloseLeft<CR>", "关闭左侧" },
			["c"] = { ":BufferLineCloseOther<CR>", "选择要关闭的标签页" },
		},
		["<leader>c"] = {
			name = "Lsp code action",
			["a"] = { "<cmd>Lspsaga code_action<CR>", "code action" },
		},
		["<leader>r"] = {
			name = "Lsp rename",
		},
		["<leader>p"] = {
			name = "获取当前文件路径",
		},
		["<leader>d"] = {
			name = "调试",
			["d"] = { "<cmd>lua require'dap'.continue()<CR>", "继续" },
			["s"] = { "<cmd>lua require'dap'.step_over()<CR>", "下一步" },
			["i"] = { "<cmd>lua require'dap'.step_into()<CR>", "进入" },
			["o"] = { "<cmd>lua require'dap'.step_out()<CR>", "退出" },
			["t"] = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "断点" },
			["r"] = { "<cmd>lua require'dap'.repl.toggle()<CR>", "打开/关闭调试终端" },
			["e"] = { "<cmd>lua require'dap'.terminate() require'dapui'.close()<CR>", "结束调试" },
		},
		["g"] = {
			name = "Lsp go to",
			["d"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "转到定义" },
			["h"] = { "<cmd>Lspsaga hover_doc<CR>", "悬停文档" },
			["r"] = { "<cmd>Lspsaga lsp_finder<CR>", "finder" },
			["p"] = { "<cmd>Lspsaga show_line_diagnostics<CR>", "显示错误" },
			["j"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "下一个错误" },
			["k"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "上一个错误" },
		},
	}),
})
