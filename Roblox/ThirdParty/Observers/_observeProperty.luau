-- observeProperty: Observe a Property of an Instance (with Optional Guard Predicate)
local stopProperty = observeProperty(
    instance: Instance,
    propertyName: string,
    callback: (value: any) -> (() -> ())?,
    guard: ((value: any) -> boolean)?
)
    -- Watches a single property (via GetPropertyChangedSignal)
    -- Runs callback(newValue) when property changes and optional guard passes; expects cleanup function return
    -- On property change or stop, previous cleanup is run
    -- Returns stop function; call stopProperty() to disconnect and clean up

-- Example: Only react to Name changes when name is non-empty
local stop = observeProperty(workspace.Model, "Name", function(name)
    print("Name is:", name)
    return function() print("Name changed from:", name) end
end, function(val) return typeof(val) == "string" and #val > 0 end)

-- The Module: https://create.roblox.com/store/asset/119664548067214/Observers
