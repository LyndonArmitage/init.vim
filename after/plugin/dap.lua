local dap = require("dap")

dap.configurations.scala = {
  {
    type = "scala",
    request = "launch",
    name = "Run or Test Target",
    metals = {
      runType = "runOrTestFile",
    },
  },
  {
    type = "scala",
    request = "launch",
    name = "Test Target",
    metals = {
      runType = "testTarget",
    },
  },
}

-- dap.configurations.c = {
--   {
--     name = "Launch",
--     type = "gdb",
--     request = "launch",
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     cwd = "${workspaceFolder}",
--   },
-- }

dap.adapters.codelldb = {
  type = 'server',
  port = "1300",
  executable = {
    command = '/usr/bin/codelldb',
    args = {"--port", "1300"},
    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

dap.configurations.rust = dap.configurations.cpp
dap.configurations.c = dap.configurations.cpp

-- DAP keybinds based on: https://github.com/scalameta/nvim-metals/discussions/39
vim.keymap.set("n", "<leader>dc", function()
  dap.continue()
end, { desc = "Continue debugging" })

vim.keymap.set("n", "<leader>dr", function()
  dap.repl.toggle()
end, { desc = "Toggle Debug REPL" })

vim.keymap.set("n", "<leader>dK", function()
  require("dap.ui.widgets").hover()
end, { desc = "Show Debug hover widgets" })

vim.keymap.set("n", "<leader>dt", function()
  dap.toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })

vim.keymap.set("n", "<leader>dso", function()
  dap.step_over()
end, { desc = "Step Over" })

vim.keymap.set("n", "<leader>dsi", function()
  dap.step_into()
end, { desc = "Step Into" })

vim.keymap.set("n", "<leader>dl", function()
  dap.run_last()
end, { desc = "Run Last Debug Run" })

vim.keymap.set("n", "<leader>dq", function()
  dap.terminate()
end, { desc = "Terminate Debug run" })

require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require("nvim-dap-virtual-text").setup()
