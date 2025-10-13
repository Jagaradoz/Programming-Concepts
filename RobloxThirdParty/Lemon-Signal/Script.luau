-- LemonSignal: Lightweight, Fast, Feature-rich Signal/Event Library for Roblox
-- The Module: https://github.com/lemons-man/LemonSignal

-- Basic Api
local LemonSignal = require(path.to.LemonSignal)
local signal = LemonSignal.new()
    -- Creates a new signal object (event dispatcher)

local conn = signal:Connect(callback: (...any) -> ())
    -- Connects a function to the signal; callback will be called with all arguments when signal is fired
    -- Returns a connection object (see below)

signal:Fire(...any)
    -- Fires the signal; calls all connected callbacks with the given arguments

signal:Once(callback: (...any) -> ())
    -- Connects a callback that will be called at most once, then automatically disconnected

signal:Wait(timeout: number?)
    -- Yields the current thread until signal fires; returns all fired arguments
    -- Optionally provide a timeout (in seconds); if timeout is reached, returns nil

conn:Disconnect()
    -- Disconnects the callback from the signal

signal:Destroy()
    -- Disconnects all listeners and cleans up the signal (safe to call multiple times)

-- Connection Object
local connection = signal:Connect(callback)
connection:Disconnect()
    -- Allows manual disconnection of a single callback

connection.Connected -- boolean, true if still connected

-- Example: Basic Usage
local signal = LemonSignal.new()
local conn = signal:Connect(function(a, b)
    print("Signal fired!", a, b)
end)
signal:Fire(1, 2)           -- Output: Signal fired! 1 2
conn:Disconnect()

-- Example: Once
signal:Once(function(val) print("Once:", val) end)
signal:Fire("A")            -- Output: Once: A
signal:Fire("B")            -- No output (was disconnected after first call)

-- Example: Wait (with optional timeout)
task.spawn(function()
    local a, b = signal:Wait(2)  -- Waits up to 2 seconds for the signal
    if a then
        print("Waited for:", a, b)
    else
        print("Timed out!")
    end
end)
signal:Fire("Hi", "There")

-- Patterns
    -- Use for event-driven code, decoupled modules, custom remote event patterns, signals between objects/components
    -- Use :Once for temporary listeners (one-shot behaviors, promises)
    -- Use :Wait for synchronous, coroutine-friendly flows (e.g., wait for animation finished)

-- Performance
    -- Extremely fast; minimal overhead compared to RBXScriptSignal and other Lua signal libraries
    -- GC-friendly: connections clean up references after :Disconnect or :Destroy

-- Advanced
    -- Any number of arguments can be fired; listeners receive them all
    -- Supports both yield-style (:Wait) and callback-style (:Connect)
    -- Reentrant: listeners can connect/disconnect or fire signal inside callbacks safely

-- Notes
    -- Unlike RBXScriptSignal, LemonSignal is pure Lua and works everywhere (no engine restrictions)
    -- Safe to fire signals from multiple threads/coroutines
    -- Disconnecting/destroying is always safe, even during fire

-- Limitations
    -- Does not support "priority" listeners (all callbacks are called in the order connected)
    -- Not built-in with error handling in callbacks (add pcall/warn in callbacks if needed)
    -- :Wait only works inside a coroutine (not the main thread)

-- Example: Custom object with signal
local MyObj = {}
MyObj.OnFoo = LemonSignal.new()
function MyObj:DoThing()
    self.OnFoo:Fire(self)
end
MyObj.OnFoo:Connect(function(obj) print("Did thing!", obj) end)
MyObj:DoThing()

-- The Module: https://github.com/Data-Oriented-House/LemonSignal
