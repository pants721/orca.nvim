local M = {}

M.home_path = os.getenv("HOME")
M.data_path = M.home_path .. "/" .. ".local" .. "/" .. "share" .. "/" .. "orca"
M.todos_path = M.data_path .. "/" .. "todos"
M.notes_path = M.data_path .. "/" .. "notes"

M.date_format = "%Y-%m-%d"

return M
