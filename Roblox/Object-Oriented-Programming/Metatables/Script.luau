local table = {}

-- Set up metatables
    -- setmetatable(table, metatable)   : Attaches behavior to a table using the given metatable.

-- Metamethods:
    -- __index(table, key)              : Called when accessing a missing key.
    -- __newindex(table, key, value)    : Called when assigning to a missing key.
    -- __add(a, b)                      : Called when using the + operator.
    -- __sub(a, b)                      : Called when using the - operator.
    -- __mul(a, b)                      : Called when using the * operator.
    -- __div(a, b)                      : Called when using the / operator.
    -- __mod(a, b)                      : Called when using the % operator.
    -- __pow(a, b)                      : Called when using the ^ operator.
    -- __unm(a)                         : Called when using unary minus (-a).
    -- __eq(a, b)                       : Called when comparing with ==.
    -- __lt(a, b)                       : Called when comparing with <.
    -- __le(a, b)                       : Called when comparing with <=.
    -- __tostring(a)                    : Called when passed to tostring() or print().
    -- __call(self, ...)                : Called when the table is used like a function.
    -- __len(a)                         : Called when using the length operator (#a).
    -- __iter(a)                        : (Luau) Used for custom for-loop iteration.
    -- __mode                           : (Meta-field) Declares a table as weak (`"k"`, `"v"`, or `"kv"`), allowing garbage collection of keys/values. 

local meta = {
    __index = function() ... end
    _newindex = function() ... end
}

setmetatable(table, meta)
