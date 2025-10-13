local example = "Hello, Roblox!"

-- Functions
    -- 1. string.len(s) or #s                           : Get length of string
    -- 2. string.upper(s)                               : Convert all characters in string to uppercase
    -- 3. string.lower(s)                               : Convert all characters in string to lowercase
    -- 4. string.sub(s, start, end)                     : Extract substring from position 'start' to 'end' (inclusive)
    -- 5. string.find(s, pattern, init, plain)          : Find first occurrence of pattern in string, returns start and end indices
    -- 6. string.match(s, pattern)                      : Returns first substring matching the pattern
    -- 7. string.gmatch(s, pattern)                     : Iterator over all substrings matching the pattern
    -- 8. string.gsub(s, pattern, replacement)          : Replace occurrences of pattern with replacement, returns new string and count
    -- 9. string.format(formatstring, ...)              : Returns formatted string (like printf in C), inserts values into placeholders
    -- 10. string.rep(s, n)                             : Repeat string s, n times
    -- 11. split(s, delimiter)                          : Splits string by delimiter into a table of substrings (custom implementation required)

print("Length:", string.len(example))                                       -- Returns length of the string (14)
print("Length using #:", #example)

print(string.upper(example))                                                -- Converts string to uppercase: "HELLO, ROBLOX!"

print(string.lower(example))                                                -- Converts string to lowercase: "hello, roblox!"

print(string.sub(example, 1, 5))                                            -- Returns substring: "Hello"

local startPos, endPos = string.find(example, "Roblox")                     -- Finds "Roblox" position (8, 13)
print("Found Roblox at:", startPos, endPos)

local word = string.match(example, "%w+")                                   -- Matches first word: "Hello"
print("First word:", word)

for w in string.gmatch(example, "%w+") do                                   -- Iterate over all words
    print("Word:", w)
end

local replaced = string.gsub(example, "Roblox", "World")                    -- Replaces "Roblox" with "World"
print(replaced)                                                             -- "Hello, World!"

local formatted = string.format("Score: %d, Name: %s", 100, "Player1")
print(formatted)                                                            -- "Score: 100, Name: Player1"

print(string.rep("!", 5))                                                   -- Prints "!!!!!"

local parts = string.split(example, ",")                                    -- Splits string by commas
for i, part in ipairs(parts) do
    print("Part " .. i .. ":", part)
end



