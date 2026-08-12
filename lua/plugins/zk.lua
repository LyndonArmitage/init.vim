return {
	"zk-org/zk-nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	name = "zk",
	ft = "markdown",
	keys = {
		{ "<leader>zl", "<cmd>ZkInsertLink<cr>", desc = "Zk insert link" },
		{ "<leader>zL", ":'<,'>ZkInsertLinkAtSelection<cr>", mode = "v", desc = "Zk link selection" },
		{ "<leader>zn", "<cmd>ZkNew<cr>", desc = "Zk new note" },
		{ "<leader>zk", "<cmd>ZkNotes<cr>", desc = "Zk list notes" },
		{
			"<leader>zr",
			function()
				local zk = require("zk")
				zk.edit({ createdAfter = "7 days ago" }, { title = "Recent Notes" })
			end,
			desc = "Zk recent notes",
		},
		{
			"<leader>zd",
			function()
				local zk = require("zk")
				local util = require("zk.util")

				local root_dir = util.notebook_root(vim.fn.expand("%:p"))
				if root_dir == nil then
					vim.notify("Not in a zk notebook", vim.log.levels.ERROR)
					return
				end

				path = root_dir .. "/daily"
				vim.notify("Opening daily note", vim.log.levels.INFO)
				zk.new({
					dir = path,
				})
			end,
			desc = "Zk daily",
		},
		{
			"<leader>zy",
			function()
				local zk = require("zk")

				zk.edit({
					dir = "daily",
					created = "yesterday",
				}, {
					title = "Yesterday's daily note",
				})
			end,
			desc = "Open yesterday's daily note",
		},
		{
			"<leader>zm",
			function()
				local zk = require("zk")
				local util = require("zk.util")

				local root_dir = util.notebook_root(vim.fn.expand("%:p"))
				if root_dir == nil then
					vim.notify("Not in a zk notebook", vim.log.levels.ERROR)
					return
				end

				path = root_dir .. "/meetings"
				vim.notify("Opening meeting note", vim.log.levels.INFO)
				zk.new({
					dir = path,
				})
			end,
			desc = "Zk new meeting",
		},
	},
	opts = {
		picker = "telescope",
		-- See Setup section below
	},
}
