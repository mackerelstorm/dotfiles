local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({cmd="lazygit", hidden= true, direction="float"})
local htop = Terminal:new({cmd="htop", hidden= true, direction="float"})

function _lazygit_toggle()
    lazygit:toggle()
end
function _htop_toggle()
    htop:toggle()
end

toggleterm.setup()

