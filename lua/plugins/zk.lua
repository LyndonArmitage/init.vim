return {
  "zk-org/zk-nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  name = "zk",
  ft = "markdown",
  keys = {
    {
      "<leader>zL",
      ":'<,'>ZkInsertLinkAtSelection<cr>",
      mode = "v",
      desc = "Zk link selection",
    },
    --{ "<leader>zl", "<cmd>ZkInsertLink<cr>", desc = "Zk insert link" },
    {
      "<leader>zl",
      function()
        local zk = require("zk")
        local api = require("zk.api")
        local util = require("zk.util")

        -- Capture the cursor position now, before the picker takes focus
        local location = util.get_lsp_location_from_caret()

        zk.pick_notes(
          {},
          { title = "Zk Insert link (custom title)", multi_select = false },
          function(note)
            if note == nil then
              return
            end
            local default_title = note.title or note.path

            vim.ui.input(
              {
                prompt = "Link text: ",
                default = default_title,
                scope = "cursor",
              },
              function(input)
                if input == nil then
                  return -- cancelled
                end
                local link_title = input ~= "" and input or default_title

                api.link(
                  note.path,
                  location,
                  nil,
                  { title = link_title },
                  function(err)
                    if err then
                      error(err)
                    end
                  end
                )
              end
            )
          end
        )
      end,
      desc = "Zk insert link (edit title)",
    },
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

        local path = root_dir .. "/daily"
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
