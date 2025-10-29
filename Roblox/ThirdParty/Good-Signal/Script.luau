local GoodSignal = require(path.to.GoodSignal)

local signal = GoodSignal.new()                        -- Creates a new signal

local conn = signal:Connect(function(a, b)
    print("Signal received:", a, b)
end)                                                   -- Connect a listener (returns connection object)

signal:Fire(5, "Hello")                                -- Fires the event; all listeners called with args

conn:Disconnect()                                      -- Disconnects just this listener

signal:Fire("No listeners left")                       -- Safe: no error, just nothing happens

-- You can connect multiple listeners:
signal:Connect(function(val) print("Listener 2", val) end)
signal:Fire(123)

-- Wait for a signal (yields until fired):
local a, b = signal:Wait()                             -- Yields until signal fires, then returns args

-- You can destroy the signal to clean up all connections (optional):
signal:Destroy()

-- Pattern for custom events in a class/module:
local MyClass = {}
MyClass.__index = MyClass
function MyClass.new()
    local self = setmetatable({}, MyClass)
    self.OnUpdate = GoodSignal.new()
    return self
end
function MyClass:Update(val)
    self.OnUpdate:Fire(val)
end

-- Example:
local obj = MyClass.new()
obj.OnUpdate:Connect(function(val) print("Updated:", val) end)
obj:Update("hi")

-- Notes:
    -- Does not use Roblox instances (fast, no BindableEvent)
    -- All :Connect() functions run **synchronously and sequentially** (do not yield inside handlers)
    -- No memory leaks: connections are GC’d if not referenced elsewhere
    -- Call :Disconnect() for manual control; not strictly required for cleanup
    -- For one-shot listeners, use this pattern: local conn; conn = signal:Connect(function(...) conn:Disconnect(); ... end)
    -- No error/return value propagation—just like Roblox events

-- The Module: https://create.roblox.com/store/asset/7189851196/Signal-class-comparison-with-Tests-Benchmark