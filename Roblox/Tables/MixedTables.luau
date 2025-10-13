local mixed = {100, 200, x = 1, y = 2}     -- Mixed: numeric and key-value
mixed[3] = 300                             -- Add numeric element
mixed.z = 3                                -- Add key-value pair
print(mixed[1], mixed.x)                   -- Access by index and key (100, 1)

for k, v in pairs(mixed) do ... end        -- Iterate all keys and indices
table.insert(mixed, 400)                   -- Add 400 at next numeric index
mixed.x = nil                              -- Remove key 'x'
table.remove(mixed, 1)                     -- Remove first numeric element

local copy = table.clone(mixed)            -- (Roblox) Shallow copy
