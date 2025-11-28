vim.api.nvim_create_user_command("Orca", function()
    local o = require("orca")
    o.toggle_orca()
end, {})
