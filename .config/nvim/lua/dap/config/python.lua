local dap = require("dap")

require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

-- dap.adapters.python = {
--   type = 'executable';
--   command = '/usr/bin/python';
--   args = { '-m', 'debugpy.adapter' };
-- }
-- 
-- dap.configurations.python = {
--     {
--         type = "python";
--         request = "launch";
--         name = "launch file";
--         program = "${file}";
--         pythonPath = function ()
--             return "/usr/bin/python"
--         end
--     },
--  }
