local status_ok, live_server = pcall(require, "live_server")
if not status_ok then
	return "没有找到 live-server"
end

live_server.setup({
	port = 12306,
	browser_command = "", -- Empty string starts up with default browser
	quiet = false,
	no_css_inject = false, -- Disables css injection if true, might be useful when testing out tailwindcss
	install_path = vim.fn.stdpath("data") .. "/live-server/",
})
