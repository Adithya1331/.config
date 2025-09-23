return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      view_options = {
        show_hidden = true,
      },
      -- Make Oil open like Telescope: vsplit, split, new tab from inside the Oil buffer
      -- See :help oil-actions
      keymaps = {
        ["<CR>"] = "actions.select",
        ["<C-v>"] = { "actions.select", opts = { vertical = true },   desc = "Open in vsplit" },
        ["<C-x>"] = { "actions.select", opts = { horizontal = true }, desc = "Open in split" },
        ["<C-t>"] = { "actions.select", opts = { tab = true },        desc = "Open in new tab" },

        -- Optional normal-mode convenience keys while inside Oil
        ["v"] = { "actions.select", opts = { vertical = true },   mode = "n", desc = "Open in vsplit" },
        ["s"] = { "actions.select", opts = { horizontal = true }, mode = "n", desc = "Open in split" },
        ["t"] = { "actions.select", opts = { tab = true },        mode = "n", desc = "Open in new tab" },

        -- Preview without leaving Oil
        ["<C-p>"] = "actions.preview",
      },
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
  }
}

