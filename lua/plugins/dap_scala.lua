-- Scala launch configs for nvim-dap + Metals (not a Lazy plugin spec).
-- Add more languages as sibling files and `require(...).register(dap)` from dap.lua.

local M = {}

---@param dap table
function M.register(dap)
  dap.configurations.scala = {
    {
      type = 'scala',
      request = 'launch',
      name = 'Run current file',
      metals = { runType = 'runOrTestFile' },
    },
    {
      type = 'scala',
      request = 'launch',
      name = 'Test current file',
      metals = { runType = 'testFile' },
    },
    {
      type = 'scala',
      request = 'launch',
      name = 'Test target',
      metals = { runType = 'testTarget' },
    },
  }
end

return M
