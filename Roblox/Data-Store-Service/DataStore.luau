local DataStoreService = game:GetService("DataStoreService")

-- Creating a data store
local myDataStore1 = DataStoreService:GetDataStore("MyDataStore1")
local myDataStore2 = DataStoreService:GetDataStore("MyDataStore2", "someValue")

-- Methods:
    -- 1. :GetAsync(key): Retrieves data stored under the given key (returns nil if no data)
    -- 2. :SetAsync(key, value): Saves data under the given key (overwrites any existing data)
    -- 3. :UpdateAsync(key, updateFunction): Updates the data by applying updateFunction to current value
    -- 4. :IncrementAsync(key, amount): Increments a numeric value stored under the key by amount (amount can be negative)
    -- 5. :RemoveAsync(key): Deletes the data stored under the key
myDataStore1:GetAsync("player_123")
myDataStore1:SetAsync("player_123", {score = 100, coins = 50})
myDataStore1:UpdateAsync("player_123", function(oldData)
      return ...
end)
myDataStore1:IncrementAsync("player_123_coins", 5)
myDataStore1:RemoveAsync("player_123")