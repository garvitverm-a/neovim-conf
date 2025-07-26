local cmdgroup = vim.api.nvim_create_augroup("LSP", {})

local function cmdgroupcmd(e)
    ---@param description string
    local function opts(description)
        return { buffer = e.buf, desc = description }
    end
    vim.keymap.set('n', 'gn', function() vim.lsp.buf.rename() end, opts 'Rename Variable')
    vim.keymap.set('n', 'gk', function() vim.lsp.buf.hover() end, opts "View function signature")
    vim.keymap.set({ 'n', 'x' }, 'ga', function() vim.lsp.buf.code_action() end, opts "Toggle Code Actions")
    vim.keymap.set('n', 'gvx', function() vim.diagnostic.open_float() end, opts "View diagnostic")
    vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts "Go to Declaration")
    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts "Go to Definition")
    vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts "Go to LSP References")
    vim.keymap.set('n', 'gvsd', function() vim.lsp.buf.document_symbol() end, opts "View Document Symbols")
    vim.keymap.set('n', 'gvsw', function() vim.lsp.buf.workspace_symbol() end, opts "View Workspace Symbols")
end

vim.api.nvim_create_autocmd(
    "LspAttach",
    {
        group = cmdgroup,
        callback = cmdgroupcmd
    }
)
