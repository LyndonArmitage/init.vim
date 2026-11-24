return {
  "axieax/urlview.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  cmd = {
    "UrlView",
  },
  keys = {
    {
      "<leader>l",
      "<cmd>UrlView buffer<cr>",
      mode = "n",
      desc = "Copy URL to clipboard",
    },
    {
      "<leader>J",
      "<cmd>UrlView jira<cr>",
      mode = "n",
      desc = "Copy Jira Ticket",
    },
  },
  opts = {
    default_picker = "telescope",
    default_action = "clipboard",
  },
  config = function(_, opts)
    require("urlview").setup(opts)

    -- Register custom search contexts when the plugin loads, so `:UrlView jira` works
    local search = require("urlview.search")
    local search_helpers = require("urlview.search.helpers")
    search["jira"] = search_helpers.generate_custom_search({
      capture = "TDP%-%d+",
      format = "https://zpgltd.atlassian.net/browse/%s",
    })
  end,
}
