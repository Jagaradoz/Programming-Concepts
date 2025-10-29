-- observeAttribute: Observe a Single Attribute on an Instance (with Optional Guard)
local stopAttr = observeAttribute(
    instance: Instance,
    name: string,
    callback: (value: any) -> (() -> ())?,
    guard: ((value: any) -> boolean)?
)
    -- Watches a specific attribute (existing and future changes)
    -- Runs callback(value) on non-nil changes where guard passes (if any); expects cleanup as return
    -- On attribute removal/change or stop, previous cleanup is run
    -- Returns stop function

-- Example: Only observe when attribute is a string
local stop = observeAttribute(workspace.Model, "CustomName", function(value)
    print("Attribute now:", value)
    return function() print("Attribute gone:", value) end
end, function(value) return typeof(value) == "string" end)

-- The Module: https://create.roblox.com/store/asset/119664548067214/Observers
