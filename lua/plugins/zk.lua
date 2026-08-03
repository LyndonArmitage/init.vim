return {
	"zk-org/zk-nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	name = "zk",
	keys = {
		{ "<leader>zl", "<cmd>ZkInsertLink<cr>", desc = "Zk insert link" },
		{ "<leader>zL", ":'<,'>ZkInsertLinkAtSelection<cr>", mode = "v", desc = "Zk link selection" },
		{ "<leader>zn", "<cmd>ZkNew<cr>", desc = "Zk new note" },
		{ "<leader>zk", "<cmd>ZkNotes<cr>", desc = "Zk list notes" },
	},
	opts = {
		picker = "telescope",
		-- See Setup section below
	},
}
