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
