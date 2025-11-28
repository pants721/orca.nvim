# orca.nvim

A plugin to replecate my daily journal workflow. Pretty much just toggles between the current tab and a tab containing a vertical split between a to-do list file and a notes file for the day.

Files are stored in `~/.local/share/orca` under their date with the format `YYYY-MM-DD.md`.

## 📦 Installation

[lazy.nvim](https://github.com/folke/lazy.nvim):
```lua
{
    "pants721/orca.nvim",
    opts = {},
},
```

or with keybinds:
```lua
{
    "pants721/orca.nvim",
    config = function ()
        local orca = require("orca")
        orca.setup()
        vim.keymap.set("n", "<leader>o", function () orca:toggle_orca() end)
    end
},
```
