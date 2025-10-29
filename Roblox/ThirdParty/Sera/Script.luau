-- Basic Api
local Sera = require(path.to.Sera)
local schema = Sera.Struct({
    health = Sera.U16,
    mana = Sera.U16,
    name = Sera.String(32),
    alive = Sera.Boolean,
})                                           -- Defines a struct schema (fields and types, names mapped to values)

local encoded = schema:Serialize({           -- Serializes a table to a compact binary string according to schema
    health = 120,
    mana = 60,
    name = "PlayerX",
    alive = true,
})

local decoded = schema:Deserialize(encoded)  -- Deserializes binary string back to table (type-safe, fields guaranteed)

-- Field Types & Arrays
Sera.U8, Sera.U16, Sera.U32                  -- Unsigned integers (8/16/32 bits)
Sera.I8, Sera.I16, Sera.I32                  -- Signed integers
Sera.F32, Sera.F64                           -- Floating point (32/64 bits)
Sera.Boolean                                 -- Single bit boolean
Sera.String(maxLen)                          -- Fixed-size UTF-8 string (maxLen bytes)
Sera.Array(type, count)                      -- Array of fields (e.g., Sera.Array(Sera.U16, 5))
Sera.Optional(type)                          -- Optional value (adds present/not-present bit)

-- Nested Structs & Complex Types
local itemSchema = Sera.Struct({
    id = Sera.U16,
    quantity = Sera.U8,
})
local invSchema = Sera.Struct({
    items = Sera.Array(itemSchema, 10),
})

-- Usage Patterns
local data = {health = 100, mana = 10, name = "Joe", alive = false}
local bin = schema:Serialize(data)           -- Returns compact binary string (can be sent over RemoteEvent/DataStore)
local tbl = schema:Deserialize(bin)          -- Returns table: {health=100, mana=10, ...}

-- Byte Size Calculation 
local byteCount = schema:ByteSize()          -- Returns size in bytes of this struct when serialized

-- Example: Networking Struct
local Packet = Sera.Struct({
    id = Sera.U8,
    payload = Sera.String(128),
})
local str = Packet:Serialize({id=1, payload="hello"})
local msg = Packet:Deserialize(str)

-- Versioning, Migration & Schema Evolution --
    -- Use Sera.Optional to add fields safely (old data stays compatible)
    -- Use explicit field ordering for deterministic layouts (don't change field order!)

-- Efficiency --
    -- Faster and more compact than table-to-JSON or table-to-string
    -- Enforces exact field layout and type for safe cross-version or cross-language protocols

-- Custom Types (Manual Schemas)
    -- You can define your own type with Sera.Type if you want full control over serialization of custom objects.

-- Notes
    -- Does NOT support serializing Lua functions, userdata, Roblox Instances, or non-primitive types (stick to basic types, tables, arrays)
    -- Output is a binary string, not a Lua table
    -- Use Sera.String for strings; arrays for repeated fields; Struct for groupings
    -- Optional fields add 1 bit per field for presence
    -- Supports deterministic, safe, cross-version upgrades with Optional/Array fields

-- The Module: https://github.com/MadStudioRoblox/Sera/blob/main/Sera.luau