-- Basic Api
local WaitForEventWithTimeout = require(path.to.WaitForEventWithTimeout)
local timedOut, ... = WaitForEventWithTimeout(event: RBXScriptSignal, timeoutInSeconds: number)
    -- Waits for the given event to fire, or until timeout (in seconds) expires
    -- If the event fires first, returns (false, ...eventArgs) where ...eventArgs are the arguments from the event
    -- If the timeout happens first, returns (true) (no additional event arguments)

-- Example: Wait for a player's jump, but give up after 3 seconds
local UserInputService = game:GetService("UserInputService")
local timedOut, inputObj = WaitForEventWithTimeout(UserInputService.JumpRequest, 3)
if timedOut then
    print("User did not jump in time!")
else
    print("User jumped!", inputObj)
end

-- How It Works
    -- Subscribes to event: RBXScriptSignal:Once(handler) (fires only once, then disconnects automatically)
    -- Also starts a timer using task.delay(timeoutInSeconds, ...)
    -- Whichever happens first (event or timeout) will disconnect the event and resume the waiting coroutine
    -- Yields the calling thread until either the event fires or the timeout occurs

-- Return Values
    -- (false, ...eventArgs): event fired before timeout (false = not timed out)
    -- (true): timeout occurred before the event fired (true = did time out)

-- Notes
    -- Works with any RBXScriptSignal (Touched, ChildAdded, RemoteEvent.OnServerEvent, etc)
    -- Cleans up connection to avoid memory leaks
    -- Coroutine-safe, can be called from any yielding thread
    -- Only returns event arguments if event fired before timeout; timeout returns only true
    -- Does not throw; always returns a boolean as first value

-- Patterns
    -- Use to avoid infinite :Wait() on events that may never fire
    -- Ideal for timed minigames, player actions, network waits, or graceful fallback in UIs

-- Limitations
    -- Only one event/timeout per call (does not handle multiple events or signals at once)
    -- No cancellation mid-wait except by timeout or event firing

-- Example: Wait for click or timeout
local timedOut, clickObj = WaitForEventWithTimeout(someButton.MouseButton1Click, 2)
if timedOut then
    print("No click after 2 seconds!")
else
    print("Clicked!", clickObj)
end

-- The Module: https://create.roblox.com/store/asset/116382382498753/waitWithTimeout