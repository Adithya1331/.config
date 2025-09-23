print("Adithya")
require("config.lazy")
vim.opt.number = true
vim.opt.relativenumber = true
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
vim.keymap.set("n", "-", "<cmd>Oil<CR>")
vim.keymap.set("n", "nl", "<cmd>nohl<CR>")
vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}
vim.opt.clipboard = "unnamedplus"
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Navigate left" })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Navigate down" })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Navigate up" })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Navigate right" })
