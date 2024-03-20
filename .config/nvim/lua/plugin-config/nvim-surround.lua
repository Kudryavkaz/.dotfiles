local status, surround = pcall(require, "nvim-surround")
if not status then
	vim.notify("没有找到 nvim-surround")
	return
end

surround.setup({
	keymaps = {
		insert = "<C-g>s",
		insert_line = "<C-g>S",
		normal = "ys",
		normal_cur = "yss",
		normal_line = "yS",
		normal_cur_line = "ySS",
		visual = "D",
		visual_line = "gS",
		delete = "ds",
		change = "cs",
		change_line = "cS",
	},
})
