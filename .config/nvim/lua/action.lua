local opt = { noremap = true, silent = true }
local term = "<cmd>sp | terminal<CR><cmd>resize -3<CR>"

-- golang
vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	callback = function()
		local run = term .. "go run " .. vim.api.nvim_buf_get_name(0) .. "<CR>"
		vim.api.nvim_buf_set_keymap(0, "n", "<leader><F5>", run, opt)
	end,
})

-- python
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		local run = term .. "python " .. vim.api.nvim_buf_get_name(0) .. "<CR>"
		vim.api.nvim_buf_set_keymap(0, "n", "<leader><F5>", run, opt)
	end,
})

-- cpp
vim.api.nvim_create_autocmd("FileType", {
	pattern = "cpp",
	callback = function()
		-- 编译 space+b
		vim.api.nvim_buf_set_keymap(0, "n", "<leader>b", "<cmd>!g++ -std=c++20 -Wall -O2 -g % -o %:r<CR>", opt)
		-- 运行 F5
		local fileName = vim.api.nvim_buf_get_name(0)
		local fileBasename = string.gsub(fileName, ".cpp", "")
		local run = term .. fileBasename .. "<CR>"
		vim.api.nvim_buf_set_keymap(0, "n", "<leader><F5>", run, opt)
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<leader>ov",
			-- "<cmd>silent !code ~/Coding/C-workshop<CR><cmd>silent !code %<CR>",
			"<CMD>silent !code --file-uri /home/zhangfish/Coding/C-workshop/workspace/C-workshop.code-workspace<CR><CMD>silent !code %<CR>",
            opt
		)
	end,
})

-- html
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "html" },
	callback = function()
		-- 预览
		vim.api.nvim_buf_set_keymap(0, "n", "<leader><F5>", "<cmd>silent !xdg-open %<CR>", opt)
	end,
})
