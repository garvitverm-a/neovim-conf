return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
        require("noice").setup({
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = false
            },
        })
    end
}
