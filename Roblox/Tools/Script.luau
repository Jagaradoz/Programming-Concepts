-- Tools:
    -- Tools are special objects designed to be equipped and used by players, typically for actions like weapons, gadgets, or utilities.
    -- Tools are placed inside StarterPack so players get them when they spawn.

-- Properties(Behavior):
    -- CanBeDropped (bool):
        -- Determines if a player can drop the tool from their inventory.
        -- true = player can drop it; false = tool cannot be dropped.
    -- ManualActivationOnly (bool):
        -- If true, the tool only activates via script, not by player clicking.
        -- Useful for tools that require manual scripted triggers instead of default clicks.
    -- ModelStreamingMode (enum):
        -- Controls how models inside the tool are streamed to the client.
        -- Default behavior for asset streaming.
    -- RequiresHandle (bool):
        -- Indicates if the tool requires a "Handle" part to be equipped properly.
        -- Handle is usually a Part named "Handle" that the player holds when equipped.
        -- If true, the tool must have a handle part.

-- Events:
    -- Equipped(): Fired when the player equips the tool.
    -- Unequipped(): Fired when the tool is unequipped.
    -- Activated(): Fired when the player clicks while the tool is equipped.
    -- Deactivated(): Fired when the player releases the click or stops using the tool after activation.

-- Code Event Examples:

local tool = script.Parent

tool.Equipped:Connect(function() ... end)
tool.Unequipped:Connect(function() ... end)
tool.Activated:Connect(function() ... end)
tool.Deactivated:Connect(function() ... end)