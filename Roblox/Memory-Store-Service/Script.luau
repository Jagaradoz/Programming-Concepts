local MemoryStoreService = game:GetService("MemoryStoreService")

-- Creating memory store objects
local hashMap    = MemoryStoreService:GetHashMap("MyHashMap")
local queue      = MemoryStoreService:GetQueue("MyQueue")
local sortedMap  = MemoryStoreService:GetSortedMap("MySortedMap")

-- 1. MemoryStoreHashMap (Key-Value store without sorting, fast temporary storage)
    -- Methods:
    -- 1. :SetAsync(key, value, expirationSeconds)
        -- Stores 'value' at 'key'. Data expires after 'expirationSeconds' (max 45 days).
    -- 2. :GetAsync(key)
        -- Retrieves the value stored at 'key'. Returns nil if missing.
    -- 3. :UpdateAsync(key, transformFunction, expirationSeconds)
        -- Atomically updates a value. transformFunction receives the old value, must return a new value.
    -- 4. :RemoveAsync(key)
        -- Deletes data stored at 'key'.

-- Usage Examples:
local success, err = pcall(function()
    hashMap:SetAsync("player_123", {coins = 100, score = 50}, 3600) -- Expires in 1 hour
end)
if not success then warn("Failed to set hash map:", err) end

local data
success, data = pcall(function()
    return hashMap:GetAsync("player_123")
end)
if success and data then
    print("Coins:", data.coins, "Score:", data.score)
end

-- Update player coins safely
local success, err = pcall(function()
    hashMap:UpdateAsync("player_123", function(oldValue)
        oldValue = oldValue or {coins = 0, score = 0}
        oldValue.coins += 50
        return oldValue
    end, 3600)
end)
if not success then warn("Failed to update hash map:", err) end

---------------------------------------------------------------------------------------------------
-- 2. MemoryStoreQueue (FIFO queue: First In, First Out)
---------------------------------------------------------------------------------------------------
-- Methods:
    -- 1. :AddAsync(value, expirationSeconds, priority)
        -- Adds an item to the queue. Automatically expires after 'expirationSeconds' (max 7 days).
        -- Optional: 'priority' → higher numbers = dequeued first.
    -- 2. :ReadAsync(count, allOrNothing, waitTimeout)
        -- Reads up to 'count' items.
        -- allOrNothing = true → returns only if enough items exist.
        -- waitTimeout = seconds to wait for items if queue is empty (default = 0).
        -- Returns an array of reserved items.
    -- 3. :RemoveAsync(itemId)
        -- Removes a reserved item from the queue by ID (must be called after processing).

-- Usage Examples:
-- Add a player to queue
local success, err = pcall(function()
    queue:AddAsync("player_123", 60) -- Expires after 60s if not processed
end)
if not success then warn("Failed to add to queue:", err) end

-- Read up to 5 players from queue
local success, items = pcall(function()
    return queue:ReadAsync(5, false, 10) -- Get 5 players, wait 10s if empty
end)
if success and items then
    for _, item in ipairs(items) do
        print("Dequeued:", item.value)
        queue:RemoveAsync(item.id) -- Important: remove after processing
    end
else
    warn("Failed to read queue")
end

---------------------------------------------------------------------------------------------------
-- 3. MemoryStoreSortedMap (Key-Value pairs sorted by numeric value, best for leaderboards)
---------------------------------------------------------------------------------------------------
-- Methods:
    -- 1. :SetAsync(key, value, expirationSeconds)
        -- Stores 'value' at 'key' and sorts automatically. Expires after 'expirationSeconds' (max 45 days).
    -- 2. :GetAsync(key)
        -- Retrieves the value stored at 'key'. Returns nil if missing.
    -- 3. :RemoveAsync(key)
        -- Deletes data stored at 'key'.
    -- 4. :GetRangeAsync(direction, count, exclusiveLowerBound, exclusiveUpperBound)
        -- Gets a range of sorted entries.
        -- direction = Enum.SortDirection.Ascending / Descending.
        -- count = max number of entries to fetch.
        -- exclusiveLowerBound, exclusiveUpperBound = optional numeric score limits.

-- Usage Examples:
-- Set player score
local success, err = pcall(function()
    sortedMap:SetAsync("player_123", 1500, 3600) -- Score expires in 1 hour
end)
if not success then warn("Failed to set sorted map:", err) end

-- Get player score
local score
success, score = pcall(function()
    return sortedMap:GetAsync("player_123")
end)
if success then
    print("Player Score:", score)
end

-- Get Top 10 Leaderboard
local success, topPlayers = pcall(function()
    return sortedMap:GetRangeAsync(Enum.SortDirection.Descending, 10)
end)
if success then
    for rank, entry in ipairs(topPlayers) do
        print(rank .. ". Player:", entry.key, "Score:", entry.value)
    end
else
    warn("Failed to fetch leaderboard:", topPlayers)
end