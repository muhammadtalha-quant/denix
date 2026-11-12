local KEYS = require("lib.keys")
local helpers = require("lib.helpers")


hl.bind(
    helpers.register(
        KEYS.MODIFIER.SUPER,
        KEYS.MODIFIER.ALT,
        KEYS.ALPHABET.L
    ),
    function()
        local current_layout = hl.get_config("general.layout")
        local layout_name = ""
        if current_layout == "master" then
            layout_name = "scrolling"
        else
            layout_name = "master"
        end
        hl.config({
            general = {
                layout = layout_name,
            }
        })
        hl.dispatch(hl.dsp.exec_cmd("notify-send -u normal -t 2000 -a hyprland -i dialog-ok " ..
            "'Applied Layout: " .. layout_name .. "'"))
        hl.exec_cmd("notify-send -u normal -t 2000 -a hyprland -i dialog-ok " ..
            "'Applied Layout: " .. layout_name .. "'")
    end
)

hl.bind(
    helpers.register(
        KEYS.MODIFIER.SUPER,
        KEYS.ALPHABET.Q
    ),
    hl.dsp.window.close(),
    {
        description = "Gracefully Close Window"
    }
)


hl.bind(
    helpers.register(
        KEYS.MODIFIER.SUPER,
        KEYS.MODIFIER.SHIFT,
        KEYS.ALPHABET.Q
    ),
    hl.dsp.window.kill(),
    {
        description = "Forcefully Close Window"
    }
)

hl.bind(
    helpers.register(
        KEYS.MODIFIER.SUPER,
        KEYS.ALPHABET.T
    ),
    hl.dsp.window.float(),
    {
        description = "Toggle [Un]float"
    }
)

hl.bind(
    helpers.register(
        KEYS.MODIFIER.SUPER,
        KEYS.ALPHABET.P
    ),
    hl.dsp.window.pin(),
    {
        description = "Toggle [Un]pin Floating Windows"
    }
)

hl.bind(
    helpers.register(
        KEYS.MODIFIER.SUPER,
        KEYS.ARROW.LEFT
    ),
    hl.dsp.focus({
        direction = "left"
    }),
    {
        description = "Focus Window Left"
    }
)

hl.bind(
    helpers.register(
        KEYS.MODIFIER.SUPER,
        KEYS.ARROW.RIGHT
    ),
    hl.dsp.focus({
        direction = "right"
    }),
    {
        description = "Focus Window Right"
    }
)
hl.bind(
    helpers.register(
        KEYS.MODIFIER.SUPER,
        KEYS.ARROW.UP
    ),
    hl.dsp.focus({
        direction = "up"
    }),
    {
        description = "Focus Window Up"
    }
)

hl.bind(
    helpers.register(
        KEYS.MODIFIER.SUPER,
        KEYS.ARROW.DOWN
    ),
    hl.dsp.focus({
        direction = "down"
    }),
    {
        description = "Focus Window Down"
    }
)


hl.bind(
    helpers.register(
        KEYS.MODIFIER.SUPER,
        KEYS.ALPHABET.F
    ),
    hl.dsp.window.fullscreen(
        {
            mode = "maximized",
            action = "toggle"
        }
    ),
    {
        description = "Window: Maximize"
    }
)


hl.bind(
    helpers.register(
        KEYS.MODIFIER.SUPER,
        KEYS.MODIFIER.SHIFT,
        KEYS.ALPHABET.F
    ),
    hl.dsp.window.fullscreen(),
    {

        description = "Toggle Fullscreen"
    }
)

hl.bind(
    helpers.register(
        KEYS.MODIFIER.SUPER,
        KEYS.MOUSE.LMB
    ),
    hl.dsp.window.drag(),
    {
        description = "Drag Window"
    }
)

hl.bind(
    helpers.register(
        KEYS.MODIFIER.SUPER,
        KEYS.MOUSE.RMB
    ),
    hl.dsp.window.resize(),
    {
        description = "Resize Window"
    }
)


hl.bind(
    helpers.register(
        KEYS.MODIFIER.SUPER,
        KEYS.MODIFIER.SHIFT,
        KEYS.ARROW.LEFT
    ),
    function()

    end,
    {
        description = "Swap "
    }
)
