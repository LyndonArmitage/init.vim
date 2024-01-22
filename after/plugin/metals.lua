-- Metals configuration

local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = false })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    local metals_config = require("metals").bare_config()
    metals_config.settings.testUserInterface = "Test Explorer"
    metals_config.init_options.statusBarProvider = "on"
    metals_config.init_options.testExplorerProvider = true

    metals_config.on_attach = function(client, bufnr)
      require("metals").setup_dap()
      vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end)
      vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end)
      vim.keymap.set("n", "K", vim.lsp.buf.hover)
      vim.keymap.set("n", "<leader>t", function() require("telescope").extensions.metals.commands() end)

      -- DAP keybinds based on: https://github.com/scalameta/nvim-metals/discussions/39
      vim.keymap.set("n", "<leader>dc", function()
        require("dap").continue()
      end)

      vim.keymap.set("n", "<leader>dr", function()
        require("dap").repl.toggle()
      end)

      vim.keymap.set("n", "<leader>dK", function()
        require("dap.ui.widgets").hover()
      end)

      vim.keymap.set("n", "<leader>dt", function()
        require("dap").toggle_breakpoint()
      end)

      vim.keymap.set("n", "<leader>dso", function()
        require("dap").step_over()
      end)

      vim.keymap.set("n", "<leader>dsi", function()
        require("dap").step_into()
      end)

      vim.keymap.set("n", "<leader>dl", function()
        require("dap").run_last()
      end)
    end
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})
