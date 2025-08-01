return {
    'akinsho/toggleterm.nvim',
    config = function()
        require("toggleterm").setup({
            open_mapping = false,
            direction = 'float',
            close_on_exit = true
        })

        vim.keymap.set("n", "<leader>t", "<CMD>ToggleTerm<CR>", { desc = "Toggle terminal instance" })
    end,
}
