-- == CREATION ==
local SharedTable = require(game:GetService("SharedTable"))      -- Get the SharedTable module
local st = SharedTable.new()                                     -- Creates a new empty SharedTable

-- == BASIC USAGE ==
st["Foo"] = 123                                                  -- Set key-value pairs (numbers, strings, bool, instances, etc.)
print(st["Foo"])                                                 -- Read values (works like a Lua table)

-- == PROPERTIES ==
-- SharedTable has no custom properties, but supports standard Lua table-like behavior (indexing, assignment, # for length).

-- == METHODS ==
st:Clear()                                                       -- Removes all keys and values from the SharedTable
st:Clone()                                                       -- Returns a new SharedTable with all values shallow-copied (deep copy for sub-SharedTables)
st:IsEmpty()                                                     -- Returns true if table has no keys/values
st:Get(key)                                                      -- Gets the value for the specified key (same as st[key])
st:Set(key, value)                                               -- Sets the value for the key (same as st[key] = value)
st:Remove(key)                                                   -- Removes a key and its value from the SharedTable
st:Has(key)                                                      -- Returns true if key exists in the table
st:ForEach(function(key, value) ... end)                         -- Iterates through all key-value pairs; safe and efficient
st:Merge(sourceTableOrSharedTable)                               -- Adds all key-value pairs from another (Shared)Table

-- == ITERATION ==
for key, value in pairs(st) do                                   -- Supports pairs(), ipairs() (for array-like tables)
    print(key, value)
end

-- == SHARING BETWEEN SCRIPTS ==
-- Any script that references the same SharedTable instance (usually via ModuleScript return value) shares data live.
-- E.g., require(ModuleScript) returns same SharedTable for every script.

-- == LIMITATIONS ==
-- SharedTable keys and values must be primitives (numbers, strings, booleans), Instances, or other SharedTables.
-- Cannot store functions, userdata, Roblox custom datatypes except Instance and SharedTable.
-- Not serializable for network (RemoteEvent/Function), not DataStore compatible.
-- Not thread-safe for simultaneous read/write (avoid concurrent modification in coroutines).

-- == ADVANCED/EXAMPLES ==

-- Example: Shared cache pattern
local cache = SharedTable.new()
cache:Set("Result", 999)

-- Singleton pattern:
local Module = {}
local _SHARED = SharedTable.new()
function Module.getShared() return _SHARED end
return Module

-- Safe bulk update:
local source = {a=1, b=2}
st:Merge(source)

-- Checking for emptiness:
if st:IsEmpty() then print("SharedTable is empty!") end

-- Array-like usage:
for i = 1, 5 do st[i] = i * i end
for i, v in ipairs(st) do print(i, v) end

-- == MEMORY MANAGEMENT ==
-- When all references to a SharedTable are lost, it is automatically cleaned up (garbage collected).
-- Clone() creates an independent copy (values copied, sub-SharedTables are cloned).

-- == EVENTS/SIGNALS ==
-- SharedTable does **not** support change events/signals (like BindableEvent). To react to changes, you must poll or wrap with your own event logic.

-- == COMMON USE-CASES ==
-- Caching results/data for multiple scripts/modules
-- Cross-script communication/singleton data
-- Large, read-heavy data sets that would waste memory if copied per-script

-- == NOTES ==
-- Use SharedTable only when you need live, shared access to data in the same environment
-- Not intended for use as persistent storage or direct networking
-- Full docs: https://create.roblox.com/docs/reference/engine/libraries/SharedTable
