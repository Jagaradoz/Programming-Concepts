-- observeChildren: Observe All Immediate Children of an Instance (with Optional Guard)
local stopChildren = observeChildren(
    instance: Instance,
    callback: (child: Instance) -> (() -> ())?,
    guard: ((child: Instance) -> boolean)?
)
    -- Observes every direct child of an instance (existing and future)
    -- Runs callback(child) when a child is added and passes guard (if any); expects cleanup function as return
    -- On child removal or stop, cleanup is run for that child
    -- Returns a stop function; call stopChildren() to disconnect and clean up

-- Example: Only observe Parts added to Workspace
local stop = observeChildren(workspace, function(child)
    print("Part added:", child)
    return function() print("Part removed:", child) end
end, function(child) return child:IsA("Part") end)

-- The Module: https://create.roblox.com/store/asset/119664548067214/Observers
