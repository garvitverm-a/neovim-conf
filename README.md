## Prerequisites

- Git
- Neovim ≥ 0.11
- Lua ≥ 5.4
- Any Nerd Font
- luarocks (optional: read https://github.com/folke/lazy.nvim)
- fzf ≥ 0.64

## Start

Play around using `vimtutor`, using Vim mode extensions in other editors and `:Tutor`

## Installation

Clone this into the config directory, usually `~/.config/nvim` for macOS and Linux systems and `%userprofile%\AppData\Local\nvim` for Windows systems, using git:

```bash
# macOS/Linux
git clone <github-url> ~/.config/nvim
# Windows
git clone <github-url> %userprofile%\AppData\Local\nvim
```

## Plugins

| Github URL                                               | Name             | Details                                                                                                                                                                        |
| -------------------------------------------------------- | ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| https://github.com/folke/lazy.nvim                       | Lazy             | The plugin manager for all other plugins used for this configuration. It was chosen for its ease of use and the ability to extend the configuration by creating a single file. |
| https://github.com/folke/lazydev.nvim                    | Lazydev          | A language server plugin for neovim and its lua bindings, for adding to the configuration with ease.                                                                           |
| https://github.com/nvim-treesitter/nvim-treesitter       | Treesitter       | A plugin to generate parse trees for languages, to improve finding symbols and highlighting, etc.                                                                              |
| https://github.com/mason-org/mason-lspconfig.nvim        | Mason            | A plugin for installing and managing available language servers, for essentials such as completions, formatting, jumping to definition, etc.                                   |
| https://github.com/stevearc/conform.nvim                 | Conform          | Lightweight plugin to format buffer using language server settings.                                                                                                            |
| https://github.com/Saghen/blink.cmp                      | Blink Completion | Enable completions using this plugin whenever supported by the language server.                                                                                                |
| https://github.com/windwp/nvim-autopairs                 | nvim-autopairs   | Complete parentheses, brackets, braces and quotes automatically. Optional, uncomment `enabled = false` in `lua/plugins/autopairs.lua` to disable.                              |
| https://github.com/nvim-telescope/telescope.nvim         | Telescope        | Quickly search for files, symbols, marks, etc using a fuzzy-finder menu with this plugin.                                                                                      |
| https://github.com/ThePrimeagen/harpoon                  | Harpoon          | Jump between buffers efficiently with this plugin.                                                                                                                             |
| https://github.com/echasnovski/mini.nvim                 | Mini             | A collection of plugins, this configuration uses Mini for improved text objects and keymaps for these text objects.                                                            |
| https://github.com/stevearc/oil.nvim                     | Oil              | A replacement for the explorer menu
| https://github.com/lewis6991/gitsigns.nvim               | Gitsigns         | Simple git integration directly in the neovim buffer to view updates.                                                                                                          |
| https://github.com/folke/noice.nvim                      | Noice            | Experimental plugin which is used for UI enhancements
| https://github.com/j-hui/fidget.nvim                     | Fidget           | View messages with this plugin to enable an enhanced UI experience.                                                                                                            |
| https://github.com/nvim-lualine/lualine.nvim             | Lualine          | Customize the status line to display essential information.                                                                                                                    |
| https://github.com/akinsho/toggleterm.nvim               | Toggleterm       | A floating terminal instance plugin
| https://github.com/folke/todo-comments.nvim              | Todo Comments    | Automatically highlight keywords in comments for improved readability.                                                                                                         |
| https://github.com/folke/which-key.nvim                  | Which key        | Essential plugin for starting with neovim and getting used to keymaps.                                                                                                         |

## Structure

```
nvim/
├── README.md
├── init.lua
└── lua/
    ├── settings.lua
    ├── lazyconfig.lua
    ├── lsp.lua
    ├── diagnostics.lua
    ├── telescope.lua
    └── plugins/
```

`init.lua` serves as the entry point for neovim configuration. Here all the files are imported

`lua/` contains all the files that need to be imported in `init.lua` . This folder is required by design for calling `require` in `init.lua`

`lua/settings.lua` has all the editor settings along with essential keymaps.

`lua/lazyconfig.lua` sets up the plugin manager, lazy.nvim for setting up plugins.

`lua/lsp.lua` has keymaps for commands provided by the language server: code actions, go to definition, etc.

`lua/diagnostics.lua` configures neovim to enable diagnostics, to show error messages in buffers.

`lua/telescope.lua` enables simple keymaps for telescope to fuzzy find marks, files, etc.

`lua/plugins/` has all the plugins mentioned earlier along with a simple configuration for each plugin.
