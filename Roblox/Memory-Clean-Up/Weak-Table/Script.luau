-- Use Cases:
    -- weakKeys[player] = data       → auto-remove when player leaves
    -- weakValues[id] = part         → part destroyed = entry gone
    -- weakBoth[part] = status       → remove both when no longer needed

-- Notes:
    -- Setting t[k] = {} : does NOT remove key (still exists)
    -- Setting t[k] = nil : manually removes the key
    -- Only weak tables allow automatic cleanup
    -- __mode is not a function; it's a special metatable field

-- Creating a weak table
local weakKeys = setmetatable({}, { __mode = "k" })         -- Create a weak-key table (keys can be GC'd)
local weakValues = setmetatable({}, { __mode = "v" })       -- Create a weak-value table (values can be GC'd)
local weakBoth = setmetatable({}, { __mode = "kv" })        -- Create a fully weak table (both keys and values can be GC'd)

-- Examples:
local playerStates = setmetatable({}, { __mode = "k" })

game.Players.PlayerAdded:Connect(function(player)
    playerStates[player] = { score = 0 }            -- When player leaves, playerStates[player] is automatically removed
end)
