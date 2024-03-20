local dap = require("dap")

dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = "/home/zhangfish/.local/share/nvim/mason/bin/OpenDebugAD7",
}

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "cppdbg",
		request = "launch",
		program = "${fileDirname}/${fileBasenameNoExtension}",
		cwd = "${workspaceFolder}",
		stopAtEntry = true,
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "enable pretty printing",
				ignoreFailures = true,
			},
		},
	},
}
dap.configurations.c = dap.configurations.cpp
