local themes = {
    {
        'folke/tokyonight.nvim',
        priority = 1000,
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require('tokyonight').setup {
                styles = {
                    comments = { italic = false },
                },
            }
            vim.cmd.colorscheme 'tokyonight-night'
        end
    }, {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    config = function()
        vim.cmd.colorscheme 'onedark'
    end
},
}
return themes[2]
