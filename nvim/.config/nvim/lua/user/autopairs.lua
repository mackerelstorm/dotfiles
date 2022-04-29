local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
    return
end

autopairs.setup {
    check_ts = true,
    fast_wrap = {
        map = "<A-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%=%>%]%)%}%,] ]], "%s+", ""),
        offset = 0,
        end_key = "$",
        keys = "qwertyuiopåasdfghjkløæ",
        check_comma = true,
        highlight = "Pmenusel",
        highlight_grey = "LineNr",
    },
}

local cmp_autopairs = require("nvim-autopairs.completion.cmp")

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

cmp.event:on( "confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
