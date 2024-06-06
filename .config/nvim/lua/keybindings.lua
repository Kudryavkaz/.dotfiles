-- 设置leaderkey
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- 本地变量
local map = vim.keymap.set
-- local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- 基本快捷键
map("n", "<leader>a", "ggVG", opt)
map({ "n", "i", "v" }, "<F1>", "", opt)
-- 在浏览器中打开
map("n", "<leader>ob", ":silent !xdg-open %<CR>", opt)
-- 在vscode中打开
map("n", "<leader>ov", ":silent !code %<CR>", opt)
-- 窗口管理
-- 回到Dashboard
map("n", "<leader>h", ":Dashboard<CR>", opt)
-- windows 分屏快捷键
map("n", "<leader>sv", ":vsp<CR>", opt)
map("n", "<leader>sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "<leader>sc", "<C-w>c", opt)
-- 关闭其他
map("n", "<leader>so", "<C-w>o", opt)
-- Alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)
-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "<leader>s,", ":vertical resize -20<CR>", opt)
map("n", "<leader>s.", ":vertical resize +20<CR>", opt)
-- 上下比例
map("n", "<leader>sj", ":resize +8<CR>", opt)
map("n", "<leader>sk", ":resize -8<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- 等比例
map("n", "<leader>s=", "<C-w>=", opt)
-- Terminal相关
map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)
map("t", "<A-q>", [[ <C-\><C-N><cmd>bdelete! %<CR> ]], opt)
map("n", "<A-q>", [[ <cmd>bdelete! %<CR> ]], opt)

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

-- 复制当前文件路径
map("n", "<leader>pwd", ":silent !echo %:p <Bar> wl-copy<CR>", opt)

-- OSC52
local status, osc52 = pcall(require, "osc52")
if status then
	map("n", "y", osc52.copy_operator, { expr = true })
	map("n", "yy", "y_", { remap = true })
	map("v", "y", osc52.copy_visual)
end

-- 插件快捷键
local pluginKeys = {}
-- LSP快捷键
pluginKeys.mapLSP = function(mapbuf)
	-- rename
	mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
	-- mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
	-- code action
	mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
	-- mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
	-- go xx
	mapbuf("n", "gd", function()
		require("telescope.builtin").lsp_definitions({
			initial_mode = "normal",
		})
	end, opt)
	mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
	mapbuf(
		"n",
		"gr",
		"<cmd>lua require'telescope.builtin'.lsp_references(require('telescope.themes').get_ivy())<CR>",
		opt
	)
	-- mapbuf("n", "gd", "<cmd>Lspsaga preview_definition<CR>", opt)
	-- mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opt)
	-- mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
	-- diagnostic
	mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>")
	mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>")
	mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
	mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opt)
	-- mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
	-- mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opt)
	-- mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opt)
end

map("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opt)

-- typescript 快捷键
pluginKeys.mapTsLSP = function(mapbuf)
	mapbuf("n", "gs", ":TSLspOrganize<CR>", opt)
	mapbuf("n", "gm", ":TSLspRenameFile<CR>", opt)
	mapbuf("n", "gi", ":TSLspImportAll<CR>", opt)
end

-- 调试快捷键
-- map("n", "<leader>dd", "<cmd>lua require'dap'.continue()<CR>", opt)
-- map("n", "<leader>de", "<cmd>lua require'dap'.terminate() require'dapui'.close()<CR>", opt)
-- map("n", "<leader>ds", "<cmd>lua require'dap'.step_over()<CR>", opt)
-- map("n", "<leader>di", "<cmd>lua require'dap'.step_into()<CR>", opt)
-- map("n", "<leader>do", "<cmd>lua require'dap'.step_out()<CR>", opt)
-- map("n", "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opt)
-- map("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<CR>", opt)

-- Copilot
map("i", "<C-A>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true
map("n", "<leader>cd", "<cmd>Copilot disable<CR>", opt)
map("n", "<leader>ce", "<cmd>Copilot enable<CR>", opt)

--补全快捷键
-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
	local feedkey = function(key, mode)
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
	end

	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	return {
		-- 出现补全
		["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		-- 取消
		["<A-,>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- 上一个
		["<C-k>"] = cmp.mapping.select_prev_item(),
		-- 下一个
		["<C-j>"] = cmp.mapping.select_next_item(),
		-- 确认
		["<CR>"] = cmp.mapping.confirm({
			select = false,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
		-- 如果窗口内容太多，可以滚动
		["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		-- 自定义代码段跳转到下一个参数
		["<C-l>"] = cmp.mapping(function(_)
			if vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			end
		end, { "s" }),
		-- 自定义代码段跳转到上一个参数
		["<C-h>"] = cmp.mapping(function()
			if vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "s" }),

		-- Super Tab
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			elseif has_words_before() then
				cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),
		-- end of super Tab
	}
end

-- bufferline
-- 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- Telescope
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
-- 显示隐藏文件
map("n", "<leader><C-h>", ":Telescope find_files hidden=true<CR>", opt)
-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
	i = {
		-- 上下移动
		["<C-j>"] = "move_selection_next",
		["<C-k>"] = "move_selection_previous",
		["<Down>"] = "move_selection_next",
		["<Up>"] = "move_selection_previous",
		-- 历史记录
		["<C-n>"] = "cycle_history_next",
		["<C-p>"] = "cycle_history_prev",
		-- 关闭窗口
		["<C-c>"] = "close",
		-- 预览窗口上下滚动
		["<C-u>"] = "preview_scrolling_up",
		["<C-d>"] = "preview_scrolling_down",
	},
}

-- nvim-treesitter
-- 调整代码缩进
map("n", "F", "gg=G<C-o>", opt)

-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "<A-m>", ":cd $PWD<CR> :NvimTreeToggle<CR>", opt)
map("n", "<A-b>", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
	-- 打开文件或文件夹
	{ key = { "<CR>", "o", "<18-LeftMouse>" }, action = "edit" },
	-- 分屏打开文件
	{ key = "v", action = "vsplit" },
	{ key = "h", action = "split" },
	-- 显示隐藏文件
	{ key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
	{ key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
	-- 文件操作
	{ key = "<F21>", action = "refresh" },
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "s", action = "system_open" },
}
return pluginKeys
