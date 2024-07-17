local status, leap = pcall(require, "leap")
if not status then
	vim.notify("没有找到 indent_blankline")
	return
end

leap.setup({})
leap.create_default_mappings()
