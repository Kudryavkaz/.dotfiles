local status, db = pcall(require, "hardtime")
if not status then
  vim.notify("没有找到 hardtime")
  return
end

require("hardtime").setup()
