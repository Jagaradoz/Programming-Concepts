local var1 = true                       -- Boolean: true or false
local var2 = 65                         -- Number (integer or float): Lua uses double precision floating-point numbers for all numbers
local var3 = 1.23                       -- Number with decimal
local var4 = 123456789012345            -- Large number (all numbers are doubles in Lua)
local var5 = "Hello World!"             -- String: immutable sequence of characters
local var6 = nil                        -- nil: represents absence of a value
local var7 = {}                         -- Table: Lua's dynamic data structure (like arrays/dictionaries)
local var8 = Vector3.new(1, 2, 3)       -- Vector3: 3D position vector
local var9 = CFrame.new()               -- CFrame: position + rotation data

-- String (immutable)
    -- Concatenation: Join strings together
    -- Insert substring: Insert a string at a given index (manual approach)
    -- Replace substring: Replace characters from startIdx to endIdx
    -- Delete substring: Remove characters from startIdx to endIdx
    -- Reverse string: Reverse the whole string (custom function needed)
    -- Truncate string: Keep only first N characters (limit length)

local example = "Hello Lua"

insertExample = example:sub(1, 5) .. "Roblox " .. example:sub(6)    -- Result: "Hello Roblox Lua"
replaceExample = example:sub(1, 0) .. "Hi" .. example:sub(6)        -- Result: "Hi Lua"
deleteExample = example:sub(1, 0) .. example:sub(3)                 -- Result: "llo Lua"

local function reverseString(s)
    local reversed = {}
    for i = #s, 1, -1 do
        reversed[#reversed + 1] = s:sub(i, i)
    end
    return table.concat(reversed)
end
local reversedExample = reverseString("Hello")                      -- Result: "olleH"

truncateExample = example:sub(1, 10)                                -- Truncates or keeps first 10 chars


