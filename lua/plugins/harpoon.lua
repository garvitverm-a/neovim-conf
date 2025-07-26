return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        harpoon.setup({
            settings = { save_on_toggle = true }
        })

        local function append()
            harpoon:list():add()
        end

        local function toggle()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end

        vim.keymap.set("n", "<leader>a", append, { desc = "Add file to harpoon" })
        vim.keymap.set("n", "<leader>bl", toggle, { desc = "Toggle Harpoon Quick Menu" })
    end
}
