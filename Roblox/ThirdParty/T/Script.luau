-- t: Runtime Type Checking & Assertion Module for Roblox
-- The Module: https://github.com/osyrisrblx/t

-- Basic Api
local t = require(path.to.t)
local isString = t.string
local isNumber = t.number
local isInstance = t.instance
local isOptional = t.optional
local isArray = t.array
-- ...etc (see below for all types and combinators)

-- Usage: Type Validation/Checking
local ok = t.string("hello")      -- true
local ok = t.number(5)            -- true
local ok = t.number("str")        -- false

-- Usage: Runtime Assertion (throws error if not valid)
t.assert(t.string, "hello")       -- returns "hello", or throws error if not string

-- Usage: Shape/Table Type
local check = t.interface({
    name = t.string,
    age = t.optional(t.number),
})
local ok = check({name="hi"})     -- true

-- Type Validators (built-in)
t.string(value)          -- true if value is a string
t.number(value)          -- true if value is a number (not NaN/inf)
t.boolean(value)         -- true if value is a boolean
t.nil(value)             -- true if value is nil
t.table(value)           -- true if value is a table
t.callback(value)        -- true if value is a function (callable)
t.thread(value)          -- true if value is a coroutine/thread
t.Instance(value)        -- true if value is a Roblox Instance
t.BrickColor(value)      -- true if value is a BrickColor
t.Color3(value)          -- true if value is a Color3
t.Vector3(value)         -- true if value is a Vector3
t.CFrame(value)          -- true if value is a CFrame
t.Enum(value)            -- true if value is an EnumItem
t.PathWaypoint(value)    -- true if value is a PathWaypoint
t.Axes(value)            -- true if value is an Axes object
t.Faces(value)           -- true if value is a Faces object
t.Ray(value)             -- true if value is a Ray
t.Rect(value)            -- true if value is a Rect
t.UDim(value)            -- true if value is a UDim
t.UDim2(value)           -- true if value is a UDim2
t.TweenInfo(value)       -- true if value is a TweenInfo
t.Font(value)            -- true if value is a Font
t.DateTime(value)        -- true if value is a DateTime
t.error(value)           -- always returns false (for negative pattern matching)


-- Combinators & Advanced Types
t.union(t1, t2, ...)                    -- true if any validator passes
t.intersection(t1, t2, ...)             -- true if all validators pass
t.tuple(t1, t2, ...)                    -- checks if value is a tuple of types (used for function args)
t.array(tType)                          -- checks array of values for type (all must match)
t.values(tType)                         -- checks all values in a table match type
t.keys(tType)                           -- checks all keys in a table match type
t.literal(val)                          -- matches only the exact value given
t.optional(tType)                       -- matches nil or the given type

-- Table Shape & Structure Validators
t.interface({field=tType, ...})         -- all listed fields required and must match type
t.strictInterface({field=tType, ...})   -- like interface, but disallows extra fields
t.partialInterface({field=tType, ...})  -- fields are optional; if present, must match
t.map(keyType, valueType)               -- checks table keys/values types

-- Instance Validators
t.instance(className[, childChecks])     -- checks if value is Instance of className (and optionally its children)
t.children(childChecks)                  -- checks direct children of an Instance

-- Custom Predicates
local myType = t.check(function(val) return val == 10 end)
myType(10)      -- true

-- Error Reporting & Assertion
t.assert(tType, value, [errMsg])         -- throws error if not valid, else returns value

-- Patterns
    -- Use to validate arguments, configs, event payloads, module exports, or runtime data
    -- Combine for complex shapes, unions, optionals, nested tables, or arrays of structures
    -- Throw clear errors in dev mode or warn in prod

-- Notes
    -- All validators are just functions (val) -> true/false
    -- Type names are lowercase (t.string, t.number, etc)
    -- Type combinators (union, array, interface, etc) are functions that build new validators
    -- No static types—checks at runtime only
    -- Defensive coding: combine with asserts to prevent silent bugs

-- Limitations
    -- Not a replacement for Luau type system (complements it)
    -- No class/struct inheritance, only direct table/interface validation
    -- Use assert for "fail fast", or call validator for true/false (silent)

-- Example: Validate a config object
local configType = t.strictInterface({
    size = t.number,
    color = t.Color3,
    optionalName = t.optional(t.string)
})
local config = {size = 10, color = Color3.new(1,0,0)}
assert(configType(config), "Bad config!")

-- The Module: https://github.com/osyrisrblx/t
