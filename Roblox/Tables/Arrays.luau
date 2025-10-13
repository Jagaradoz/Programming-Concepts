-- Array Methods
table.insert(t, [pos,] value)                           -- Insert value at position (default end)
table.remove(t, [pos])                                  -- Remove value at position (default end)
table.sort(t, [comp])                                   -- Sort with optional compare function
table.concat(t, [sep, i, j])                            -- Concatenate t[i]..t[j] with separator
table.unpack(t, [i, j])                                 -- Unpack t[i]..t[j] to values
table.pack(...)                                         -- Pack args into a table, .n = count
table.clone(t)                                          -- (Roblox) Shallow copy
table.clear(t)                                          -- (Roblox) Remove all entries
table.find(t, value, [init])                            -- (Roblox) Find value, return index
table.create(n, value)                                  -- (Roblox) Create array of n values

-- Examples:
local array = {10, 20, 30}                              -- Create array (numeric indices)
array[4] = 40                                           -- Add new element at index 4
print(array[2])                                         -- Access element (prints 20)
table.insert(array, 5)                                  -- Append 5 at the end
table.insert(array, 2, 99)                              -- Insert 99 at position 2
table.remove(array, 3)                                  -- Remove element at index 3
print(#array)                                           -- Array length (number of elements)
for i, v in ipairs(array) do ... end                    -- Iterate in order

table.sort(array)                                       -- Sort ascending
table.sort(array, function(a, b) return a > b end)      -- Sort descending/custom

local str = table.concat(array, ", ")                   -- Join as string: "10, 99, 20, ..."
local a, b = table.unpack(array)                        -- Unpack elements to variables

table.clear(array)                                      -- Remove all entries
table.find(array, 20)                                   -- Find index of value 20, or nil if not found
local copy = table.clone(array)                         -- Shallow copy
local blank = table.create(5, 0)                        -- {0, 0, 0, 0, 0}