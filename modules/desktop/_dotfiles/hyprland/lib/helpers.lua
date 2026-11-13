local KEYS = require("lib.keys")
local M = {}

function M.register(...)
    return table.concat({ ... }, "+")
end

function M.focus_ws(workspace_id)
    hl.bind(
        M.register(
            KEYS.MODIFIER.SUPER,
            tostring(workspace_id)
        ),
        hl.dsp.focus({
            workspace = tostring(workspace_id)
        }),
        {
            description = "Focus Workspace # " .. tostring(workspace_id)
        }
    )
end

function M.cycle_workspace_animations_per_layout(layout)
    if layout == "scrolling" then
        hl.animation({ leaf = "workspaces", enabled = true, speed = 2.0, bezier = "quick", style = "slidevert" })
        hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 1.8, bezier = "quick", style = "slide" })
    elseif layout == "master" then
        hl.animation({ leaf = "workspaces", enabled = true, speed = 2.0, bezier = "quick", style = "slide" })
        hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 1.8, bezier = "quick", style = "slidevert" })
    else
        hl.animation({ leaf = "workspaces", enabled = false })
    end
end

function M.move_window_to_and_focus_ws(workspace_id)
    hl.bind(
        M.register(
            KEYS.MODIFIER.SUPER,
            KEYS.MODIFIER.SHIFT,
            tostring(workspace_id)
        ),
        hl.dsp.window.move({
            workspace = tostring(workspace_id)
        }),
        {
            description = "Move Window To Workspace # " .. tostring(workspace_id)
        }
    )
end

function M.move_window_to_ws(workspace_id)
    hl.bind(
        M.register(
            KEYS.MODIFIER.SUPER,
            KEYS.MODIFIER.ALT,
            tostring(workspace_id)
        ),
        hl.dsp.window.move({
            workspace = tostring(workspace_id),
            follow = false,
        }),
        {
            description = "Move Window (Silent) To Workspace # " .. tostring(workspace_id)
        }
    )
end

return M
