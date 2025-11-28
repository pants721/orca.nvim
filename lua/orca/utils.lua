local M = {}

local uv = vim.loop

local consts = require("orca.constants")

function M.get_date()
    return os.date(consts.date_format)
end

function M.ensure_data_paths()
    for _, path in ipairs({ consts.data_path, consts.todos_path, consts.notes_path }) do
        if not uv.fs_stat(path) then
            local ok, err = pcall(uv.fs_mkdir, path, 493) -- 493 deciaml = 755 octal
            if not ok then
                vim.notify("Failed to create orca data directory " .. path .. ": " .. err, vim.log.levels.ERROR)
            -- else
            --     vim.notify("Created orca data directory " .. path, vim.log.levels.INFO)
            end
        end
    end
end

-- XXX: maybe use vim.loop for async
function M.ensure_daily_files()
    local date_str = M.get_date()
    for idx, path in ipairs({ consts.todos_path, consts.notes_path }) do
        path = path .. "/" .. date_str .. ".md"
        local f = io.open(path, "r")
        if f == nil then
            f = io.open(path, "w")
            if f then
                if idx == 1 then
                    f:write("# TO-DO\n")
                    f:write("- [ ] \n")
                elseif idx == 2 then
                    f:write("- \n")
                end
                f:close()
            else
                vim.notify("Failed to create file: " .. path, vim.log.levels.ERROR)
            end
        else
            f:close()
        end
    end
end

return M
