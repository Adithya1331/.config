return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "lua", "go", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python" },
        auto_install = false,
        highlight = {
          enable = true,
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",    -- Start selection
            node_incremental = "grn",  -- Expand selection
            scope_incremental = "grc", -- Select parent node
            node_decremental = "grm",  -- Shrink selection
          },
        },
        indent = {
          enable = true,
          disable = { "python" }, -- Disable for specific languages if needed
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
            },
          },
          swap = {
            enable = true,
            swap_next = { ["<leader>a"] = "@parameter.inner" },
            swap_prev = { ["<leader>A"] = "@parameter.inner" },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = { ["]m"] = "@function.outer" },
            goto_next_end = { ["]M"] = "@function.outer" },
            goto_previous_start = { ["[m"] = "@function.outer" },
            goto_previous_end = { ["[M"] = "@function.outer" },
          },
          lsp_interop = {
            enable = true,
            border = "rounded",
            peek_definition_code = {
              ["<leader>df"] = "@function.outer",
              ["<leader>dF"] = "@class.outer",
            },
          },
        },
      })
    end,
  },
}


