local status, dap = pcall(require, "dap")
if not status then
	vim.notify("没有找到 dap")
	return
end

local status, dapui = pcall(require, "dapui")
if not status then
	vim.notify("没有找到 dap-ui")
	return
end

local status, vt = pcall(require, "nvim-dap-virtual-text")
if not status then
	return
end

vt.setup({
	commented = true,
})

dapui.setup({
	element_mappings = {
		scopes = {
			open = "<CR>",
			edit = "e",
			expand = "o",
			repl = "r",
		},
	},

	layouts = {
		{
			elements = {
				-- Elements can be strings or table with id and size keys.
				{ id = "scopes", size = 0.25 },
				"stacks",
				"watches",
				"breakpoints",
			},
			size = 0.25, -- 25 columns
			position = "left",
		},
		{
			elements = {
				"console",
			},
			size = 0.25, -- 25% of total lines
			position = "bottom",
		},
	},

	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "single", -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil, -- Can be integer or nil.
		max_value_lines = 100, -- Can be integer or nil.
	},
}) -- use default

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

require("dap.myui")
require("dap.config.python")
require("dap.config.cpp")
