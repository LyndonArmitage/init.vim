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

dap.configurations.c = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
  },
}

-- DAP keybinds based on: https://github.com/scalameta/nvim-metals/discussions/39
vim.keymap.set("n", "<leader>dc", function()
  dap.continue()
end)

vim.keymap.set("n", "<leader>dr", function()
  dap.repl.toggle()
end)

vim.keymap.set("n", "<leader>dK", function()
  require("dap.ui.widgets").hover()
end)

vim.keymap.set("n", "<leader>dt", function()
  dap.toggle_breakpoint()
end)

vim.keymap.set("n", "<leader>dso", function()
  dap.step_over()
end)

vim.keymap.set("n", "<leader>dsi", function()
  dap.step_into()
end)

vim.keymap.set("n", "<leader>dl", function()
  dap.run_last()
end)

vim.keymap.set("n", "<leader>dq", function()
  dap.terminate()
end)

require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require("nvim-dap-virtual-text").setup()
