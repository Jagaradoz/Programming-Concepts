local dict = {score = 15, name = "Alex"}   -- Create dictionary (key-value pairs)
dict.level = 2                             -- Add new key-value pair
print(dict["score"])                       -- Access value by key (prints 15)
dict.score = nil                           -- Remove key from dictionary

for k, v in pairs(dict) do ... end         -- Iterate all key-value pairs
if dict.name then ... end                  -- Check if a key exists
for k in pairs(dict) do dict[k] = nil end  -- Remove all keys (manual clear)

local copy = table.clone(dict)             -- (Roblox) Shallow copy
table.clear(dict)                          -- (Roblox) Remove all entries
if type(dict) == "table" then ... end      -- Type check for table
