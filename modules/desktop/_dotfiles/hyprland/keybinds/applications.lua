local KEYS = require("lib.keys")
local helpers = require("lib.helpers")

local apps = {
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.SPECIAL.ENTER)]         =
  {
    cmd = "kitty",
    desc = "Open Kitty Terminal"
  },
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.B)]            =
  {
    cmd = "google-chrome",
    desc = "Open Google Chrome Browser"
  },
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.E)]            =
  {
    cmd = "nautilus",
    desc = "Open File Manager"
  },
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.C)]            =
  {
    cmd = "zeditor",
    desc = "Open Zed Code Editor"
  },
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.PUNCTUATION.SEMICOLON)] =
  {
    cmd = "localsend_app",
    desc = "Open Localsend"
  },
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.N)]            =
  {
    cmd = "obsidian",
    desc = "Open Obsidian"
  }
}


for keybind, app in pairs(apps) do
  hl.bind(
    keybind,
    hl.dsp.exec_cmd(app.cmd),
    {
      description = app.desc,
    }
  )
end
