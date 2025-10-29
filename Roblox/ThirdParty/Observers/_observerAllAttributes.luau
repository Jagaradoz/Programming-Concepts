-- observeAllAttributes: Observe ALL Attributes on an Instance (with Optional Guard)
local stopAllAttrs = observeAllAttributes(
    instance: Instance,
    callback: (attributeName: string, value: any) -> (() -> ())?,
    guardPredicate: ((attributeName: string, value: any) -> boolean)?
)
    -- Observes all existing and future attributes on an instance
    -- Runs callback(attributeName, value) for each attribute added/changed where guard passes; expects cleanup as return
    -- Cleanup runs when attribute is removed, changed to nil, fails guard, or observer is stopped
    -- Returns stop function

-- Example: Observe all numeric attributes on a part
local stop = observeAllAttributes(workspace.Part, function(name, value)
    print("Attr", name, "=", value)
    return function() print(name, "was removed or filtered") end
end, function(name, value) return typeof(value) == "number" end)

-- The Module: https://create.roblox.com/store/asset/119664548067214/Observers
