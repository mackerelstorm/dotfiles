local name = "tokyonight"

local status_ok, colorscheme = pcall(require, name)
    if not status_ok then
        return
    end
colorscheme.load({style="night"})
