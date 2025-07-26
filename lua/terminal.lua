local terminalState = {
    buf = nil,
    window = nil,
    isOpen = false,
}

local function Terminal()
    if terminalState.isOpen
        and vim.api.nvim_win_is_valid(terminalState.window) then
        terminalState.isOpen = false
        vim.api.nvim_close_win(terminalState.window, false)
        return
    end

    if not (terminalState.isOpen
            and vim.api.nvim_buf_is_valid(terminalState.buf)) then
        terminalState.buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_option(terminalState.buf, "bufhidden", "hide")
    end

    local width = math.floor(vim.o.columns * 0.75)
    local height = math.floor(vim.o.columns * 0.75)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    local options = {
        relative = 'editor',
        width = width,
        height = height,
        row = row,
        col = col,
        style = 'minimal',
    }
    terminalState.window = vim.api.nvim_open_win(terminalState.buf, true, options)

    local hasTerminal = false
    local lines = vim.api.nvim_buf_get_lines(terminalState.buf, 0, -1, false)

    for _, line in ipairs(lines) do
        if line ~= "" then
            hasTerminal = true
            break
        end
    end

    if not hasTerminal then
        vim.fn.termopen(os.getenv("SHELL"))
    end

    terminalState.isOpen = true
    vim.cmd("startinsert")

    vim.api.nvim_create_autocmd("BufLeave", {
        buffer = terminalState.buf,
        callback = function()
            if terminalState.isOpen and vim.api.nvim_win_is_valid(terminalState.window) then
                vim.api.nvim_win_close(terminalState.window, false)
                terminalState.isOpen = false
            end
        end,
        once = true
    })
end

local function CloseTerminal()
    if terminalState.isOpen and vim.api.nvim_win_is_valid(terminalState.window) then
        vim.api.nvim_win_close(terminalState.window, false)
        terminalState.isOpen = false
    end
end

vim.keymap.set("n", "<leader>t", Terminal, { noremap = true, silent = true, desc = "Toggle floating terminal" })
vim.keymap.set("t", "<Esc>", CloseTerminal,
    { noremap = true, silent = true, desc = "Close floating terminal from terminal mode" })
