local status, db = pcall(require, "dashboard")
if not status then
	vim.notify("没有找到 dashboard")
	return
end

local stats = require("lazy").stats()
local foot = " BY NEOVIM  󰀨 v"
	.. vim.version().major
	.. "."
	.. vim.version().minor
	.. "."
	.. vim.version().patch
	.. "  󰂖 loaded "
	.. stats.count
	.. " plugins"

db.setup({
	theme = "hyper",
	config = {
		header = {
			[[]],
			[[ ⣿⡇⣿⣿⣿⠛⠁⣴⣿⡿⠿⠧⠹⠿⠘⣿⣿⣿⡇⢸⡻⣿⣿⣿⣿⣿⣿⣿ ]],
			[[ ⢹⡇⣿⣿⣿⠄⣞⣯⣷⣾⣿⣿⣧⡹⡆⡀⠉⢹⡌⠐⢿⣿⣿⣿⡞⣿⣿⣿ ]],
			[[ ⣾⡇⣿⣿⡇⣾⣿⣿⣿⣿⣿⣿⣿⣿⣄⢻⣦⡀⠁⢸⡌⠻⣿⣿⣿⡽⣿⣿ ]],
			[[ ⡇⣿⠹⣿⡇⡟⠛⣉⠁⠉⠉⠻⡿⣿⣿⣿⣿⣿⣦⣄⡉⠂⠈⠙⢿⣿⣝⣿ ]],
			[[ ⠤⢿⡄⠹⣧⣷⣸⡇⠄⠄⠲⢰⣌⣾⣿⣿⣿⣿⣿⣿⣶⣤⣤⡀⠄⠈⠻⢮ ]],
			[[   ⣧⠄⢘⢻⣿⡇⢀⣀⠄⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠄⢀ ]],
			[[   ⣿⡆⢸⣿⣿⣿⣬⣭⣴⣿⣿⣿⣿⣿⣿⣿⣯⠝⠛⠛⠙⢿⡿⠃⠄⢸ ]],
			[[   ⢿⣿⡀⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⡾⠁⢠⡇⢀ ]],
			[[   ⢸⣿⡇⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣏⣫⣻⡟⢀⠄⣿⣷⣾ ]],
			[[   ⢸⣿⡇⠄⠈⠙⠿⣿⣿⣿⣮⣿⣿⣿⣿⣿⣿⣿⣿⡿⢠⠊⢀⡇⣿⣿ ]],
			[[    ⣿⡇⢀⡲⠄⠄⠈⠙⠻⢿⣿⣿⠿⠿⠟⠛⠋⠁⣰⠇ ⢸⣿⣿⣿ ]],
			[[    ⣿⡇⢬⡻⡇⡄⠄⠄⠄⡰⢖⠔⠉⠄⠄⠄⠄⣼⠏  ⢸⣿⣿⣿ ]],
			[[    ⣿⡇⠄⠙⢌⢷⣆⡀⡾⡣⠃⠄⠄⠄⠄⠄⣼⡟    ⢿⣿⣿ ]],
			[[]],
		},
		week_header = {
			enable = false,
		},
		shortcut = {
			{ desc = " Plugin", group = "@property", action = "Lazy", key = "u" },
			{ desc = " Projects", action = "Telescope projects", key = "o" },
			{ desc = " Recently Files", action = "Telescope oldfiles", key = "f" },
			{ desc = "󰌌 Edit Keybindings", action = "edit ~/.config/nvim/lua/keybindings.lua", key = "e" },
			{
				desc = " Edit Projects",
				action = "edit  ~/.local/share/nvim/project_nvim/project_history",
				key = "w",
			},
		},
		packages = {
			enable = false,
		},
		project = {
			enable = false,
		},
        footer = {
            [[]],
            foot,
        }
	},
})
