local DataStore2 = require(game.ReplicatedStorage.DataStore2)

-- Configuration (Set these before calling DataStore2 for any player)
DataStore2.Combine("MasterKey", "Cash", "Gems")                     -- Binds multiple data stores together. When one is saved, all are saved. This is the recommended way to save player data.

-- Creation
local cashStore = DataStore2("Cash", player)                        -- Gets the DataStore2 object for a specific key ("Cash") and player.
local combinedStore = DataStore2.GetTable("MasterKey")              -- If using Combine(), gets a table of all the player's data stores bound to the master key.

-- Methods
local value = cashStore:Get(defaultValue)                           -- Retrieves the current value of the data store. If no value is set, it returns the 'defaultValue'.
cashStore:Set(newValue)                                             -- Sets the value of the data store. This value is cached locally and will be saved later.
cashStore:Increment(incrementBy, defaultValue)                      -- Adds 'incrementBy' (number) to the current value. If no value exists, it uses 'defaultValue' before incrementing.
cashStore:ClearCachedData()                                         -- Clears the locally cached data for this specific store and player.
DataStore2.SaveAll(player)                                          -- Forces a save of all DataStore2 instances for a specific player. This is rarely needed due to automatic saving.

-- Events
cashStore:OnUpdate(function(newValue) end)                          -- Fires whenever the value of the data store changes, either locally or from another server. 'newValue' is the updated value.

-- Backwards Compatibility Methods (For migrating from standard DataStores)
local originalDataStore = game:GetService("DataStoreService"):GetDataStore("OriginalCash")
local value = cashStore:Get(defaultValue, originalDataStore)        -- Tries to get from DataStore2 first, but if it's nil, it will fetch from the standard 'originalDataStore' and save it to DataStore2.

-- Example:
local Players = game:GetService("Players")

DataStore2.Combine("PlayerData", "Coins", "XP")

Players.PlayerAdded:Connect(function(player)
    local coinsStore = DataStore2("Coins", player)
    local xpStore = DataStore2("XP", player)

    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    local coins = Instance.new("IntValue")
    coins.Name = "Coins"
    coins.Value = coinsStore:Get(100)
    coins.Parent = leaderstats

    local xp = Instance.new("IntValue")
    xp.Name = "XP"
    xp.Value = xpStore:Get(0)
    xp.Parent = leaderstats

    coinsStore:OnUpdate(function(newCoins)
        coins.Value = newCoins
    end)

    xpStore:OnUpdate(function(newXP)
        xp.Value = newXP
    end)
end)

-- Example of giving a player currency
function giveCoins(player, amount)
    local coinsStore = DataStore2("Coins", player)
    coinsStore:Increment(amount)
end

-- The Module: https://github.com/Kampfkarren/Roblox/