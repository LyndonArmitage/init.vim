-- Metals configuration

local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = false })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    local metals_config = require("metals").bare_config()
    metals_config.settings.testUserInterface = "Test Explorer"
    metals_config.settings.serverVersion = "latest.snapshot" -- Maybe remove?
    metals_config.init_options.statusBarProvider = "on"
    metals_config.init_options.testExplorerProvider = true

    metals_config.on_attach = function(client, bufnr)
      require("metals").setup_dap()
      vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end)
      vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end)
      vim.keymap.set("n", "K", vim.lsp.buf.hover)
      vim.keymap.set("n", "<leader>t", function() require("telescope").extensions.metals.commands() end)
      vim.keymap.set("n", "<leader>Tr", function() require("metals.tvp").toggle_tree_view() end)
      vim.keymap.set("n", "<leader>TR", function() require("metals.tvp").reveal_in_tree() end)
    end
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})
