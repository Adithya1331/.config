return {
  "neovim/nvim-lspconfig",
  event = "LspAttach",
  init = function()
    local aug = vim.api.nvim_create_augroup("LspKeymaps", { clear = true })
    vim.api.nvim_create_autocmd("LspAttach", {
      group = aug,
      callback = function(ev)
        local buf = ev.buf
        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = buf, silent = true, noremap = true, desc = desc })
        end
        map("n", "K", vim.lsp.buf.hover, "LSP Hover")
        map({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, "Signature Help")
        map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
        map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
        map("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
        map("n", "gT", vim.lsp.buf.type_definition, "Go to Type Definition")
        map("n", "gr", vim.lsp.buf.references, "List References")
        map("n", "<leader>ds", vim.lsp.buf.document_symbol, "Document Symbols")
        map("n", "<leader>ws", vim.lsp.buf.workspace_symbol, "Workspace Symbols")
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
        map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Workspace: Add Folder")
        map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Workspace: Remove Folder")
        map("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
          "Workspace: List Folders")
        map("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
        map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
        map("n", "<leader>e", vim.diagnostic.open_float, "Line Diagnostics")
        map("n", "<leader>q", vim.diagnostic.setloclist, "Diagnostics to LocList")
        map("n", "<leader>lh", function()
          local ih = vim.lsp.inlay_hint
          if type(ih) == "table" then
            local enabled = false
            if ih.is_enabled then
              enabled = ih.is_enabled({ bufnr = buf })
            elseif ih.get then
              enabled = ih.get({ bufnr = buf })
            end
            if ih.enable then
              ih.enable(not enabled, { bufnr = buf })
            elseif ih.set then
              ih.set(buf, not enabled)
            end
          end
        end, "Toggle Inlay Hints")
      end,
    })
  end,
}
