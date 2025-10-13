-- observeDescendants: Observe All Descendants of an Instance (with Optional Guard)
local stopDescendants = observeDescendants(
    instance: Instance,
    callback: (descendant: Instance) -> (() -> ())?,
    guard: ((descendant: Instance) -> boolean)?
)
    -- Observes all descendants (existing and future) of an instance (e.g., workspace, Model)
    -- Optional guard to only watch certain types (e.g., only Parts)
    -- Runs callback(descendant) when descendant added; expects cleanup function as return
    -- On descendant removal or stop, cleanup is run
    -- Returns stop function

-- Example: Observe all Parts under a model
local stop = observeDescendants(workspace.Model, function(part)
    print("Part added", part)
    return function() print("Part removed", part) end
end, function(desc) return desc:IsA("BasePart") end)

-- The Module: https://create.roblox.com/store/asset/119664548067214/Observers
