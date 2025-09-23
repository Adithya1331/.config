return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')
      local actions = require('telescope.actions')

      telescope.setup {
        defaults = {
          mappings = {
            -- inside Telescope prompt
            i = {
              ["<C-v>"] = actions.select_vertical,   -- open selection in vsplit
              ["<C-x>"] = actions.select_horizontal, -- open selection in split
              ["<C-t>"] = actions.select_tab,        -- open selection in new tab
            },
            n = {
              -- handy normal-mode keys while in Telescope
              ["v"]     = actions.select_vertical,
              ["s"]     = actions.select_horizontal,
              ["t"]     = actions.select_tab,
            },
          },
        },
        pickers = {
          -- existing pickers
          lsp_document_symbols = {
            symbol_width = 50,
            symbols = {
              "Function","Method","Class","Interface","Module","Struct","Trait","Enum",
            },
          },
          find_files = {
            theme = "ivy",
          },
          -- buffer management niceties
          buffers = {
            sort_lastused = true,
            mappings = {
              i = { ["<C-d>"] = actions.delete_buffer },
              n = { ["dd"]    = actions.delete_buffer },
            },
          },
        },
        extensions = { fzf = {} },
      }

      telescope.load_extension('fzf')

      vim.keymap.set("n", "<space>fh", builtin.help_tags)
      vim.keymap.set("n", "<space>fd", builtin.find_files)
      vim.keymap.set("n", "<space>gs", builtin.git_status)
      vim.keymap.set("n", "<space>gb", builtin.git_branches)
      vim.keymap.set("n", "<space>lb", builtin.buffers)
      vim.keymap.set("n", "<space>ls", builtin.lsp_document_symbols)
      vim.keymap.set("n", "<space>dd", builtin.diagnostics)

      vim.keymap.set("n", "<space>en", function()
        builtin.find_files { cwd = vim.fn.stdpath("config") }
      end)

      vim.keymap.set("n", "<space>ep", function()
        builtin.find_files { cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") }
      end)

      require("config.telescope.multigrep").setup()
    end
  }
}



