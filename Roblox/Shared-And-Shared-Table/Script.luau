-- Shared
-- Usage:
shared.MyValue = 42
print(shared.MyValue)                                            -- Accessible from any script in same environment
    -- Global singletons (manual Module caching)
    -- Shared flags, debug values, or developer tooling
    -- Temporary, environment-wide state across scripts

-- Example:
if not shared.MyModule then
    shared.MyModule = require(script.MyModule)
end
local mod = shared.MyModule

-- Properties
    -- shared is a plain Lua table:
        -- Can store any Lua type (functions, tables, etc.)
        -- Global to all scripts in same environment (server or client)
    -- shared is:
        -- Isolated between client/server (separate tables)
        -- Not replicated
        -- Reset between play sessions

-- Limitations
    -- shared only applies to current VM (server sees one shared table, each client sees separate one)
    -- shared can be accidentally polluted if overused
    -- shared is not secure—any script can modify its contents
    -- shared is unrelated to SharedTable

-----------------------------------------------------------------------------------------------------------------------------------------

-- Shared Table
-- Creation
local SharedTable = require(game:GetService("SharedTable"))      -- Get the SharedTable library
local st = SharedTable.new()                                     -- Creates a new empty SharedTable

-- Usage:
st["Foo"] = 123                                                  -- Set key-value pairs (numbers, strings, booleans, Instances, SharedTables)
print(st["Foo"])                                                 -- Read values (works like a Lua table)

-- Methods
st:Clear()                                                       -- Removes all keys and values from the SharedTable
st:Clone()                                                       -- Returns a new SharedTable with all values shallow-copied (sub-SharedTables deep-cloned)
st:IsEmpty()                                                     -- Returns true if table has no keys/values
st:Get(key)                                                      -- Gets the value for the specified key (same as st[key])
st:Set(key, value)                                               -- Sets the value for the key (same as st[key] = value)
st:Remove(key)                                                   -- Removes a key and its value from the SharedTable
st:Has(key)                                                      -- Returns true if key exists in the table
st:ForEach(function(key, value) ... end)                         -- Iterates through all key-value pairs safely
st:Merge(sourceTableOrSharedTable)                               -- Adds all key-value pairs from another (Shared)Table

-- Example:
-- Basic pattern:
local Shared = require(script.SharedModule)
Shared:Set("X", 10)
print(Shared:Get("X"))                                           

-- Shared cache pattern:
local cache = SharedTable.new()
cache:Set("Result", 999)

-- Singleton SharedTable via Module:
local Module = {}
local _SHARED = SharedTable.new()
function Module.getShared() return _SHARED end
return Module

-- Bulk update with Merge:
local source = {a=1, b=2}
st:Merge(source)

-- Emptiness check:
if st:IsEmpty() then print("SharedTable is empty!") end

-- Array-like usage:
for i = 1, 5 do st[i] = i * i end
for i, v in ipairs(st) do print(i, v) end

-- Notes
    -- Use SharedTable only when you need live, shared access to data in the same environment
    -- Not intended for use as persistent storage or direct networking
    -- Any script requiring the same ModuleScript that returns a SharedTable shares live data

-- Limitations
    -- SharedTable keys/values must be:
        -- Primitives (number, string, boolean)
        -- Roblox Instances
        -- Other SharedTables
    -- Cannot store:
        -- Functions
        -- Threads
        -- Userdata
        -- Roblox custom datatypes (except Instance/SharedTable)
    -- Not serializable for network (RemoteEvent, DataStore)
    -- Not thread-safe (avoid concurrent writes from coroutines or Threads)
