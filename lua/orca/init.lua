local M = {}

local consts = require("orca.constants")
local utils = require("orca.utils")

M.setup = function(opts)
    opts = opts or {}

    local u = require("orca.utils")
    u.ensure_data_paths()
    u.ensure_daily_files()
end

local orca_tab = nil

function M.toggle_orca()
    if orca_tab and vim.api.nvim_tabpage_is_valid(orca_tab) then
        vim.api.nvim_set_current_tabpage(orca_tab)

        vim.cmd("tabclose")
        orca_tab = nil
        return
    end

    vim.cmd("tabnew")
    orca_tab = vim.api.nvim_get_current_tabpage()

    local date_str = utils.get_date()

    local todo_file = consts.todos_path .. "/" .. date_str .. ".md"
    local note_file  = consts.notes_path .. "/" .. date_str .. ".md"
    vim.cmd("edit " .. todo_file)
    local todo_win = vim.api.nvim_get_current_win()

    vim.cmd("vsplit " .. note_file)
    -- local notes_win = vim.api.nvim_get_current_win()

    vim.api.nvim_set_current_win(todo_win)
end


return M
