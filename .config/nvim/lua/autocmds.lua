local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
	clear = true,
})
local autocmd = vim.api.nvim_create_autocmd

-- 自动切换输入法
autocmd({ "InsertLeave" }, {
	group = myAutoGroup,
	pattern = "*",
	callback = function()
		local input_status = tonumber(vim.fn.system("fcitx5-remote"))
		if input_status == 2 then
			vim.fn.system("fcitx5-remote -c")
		end
	end,
})

-- 进入Terminal 自动进入插入模式
autocmd("TermOpen", {
	group = myAutoGroup,
	command = "startinsert",
})

-- Highlight on yank
autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = myAutoGroup,
	pattern = "*",
})

-- 用o换行不要延续注释
autocmd({ "BufEnter" }, {
	group = myAutoGroup,
	pattern = "*",
	callback = function()
		vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
	end,
})

-- 自动保存
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	callback = function()
		vim.fn.execute("silent! write")
	end,
})

-- 关闭copilot
-- vim.api.nvim_create_autocmd({"BufEnter"}, {
--     pattern = "*",
--     command = "Copilot disable",
-- })
