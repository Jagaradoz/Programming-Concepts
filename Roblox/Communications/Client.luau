-- Client:
    -- Code runs on each player's device.
    -- Handles user interface, input, and visuals.
    -- Cannot directly change the game world for other players.
    -- Faster response to player actions but limited access to sensitive data.

--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------

-- Events and Functions

-- Remote Event:
-- Scenario: Server wants to notify clients or clients want to notify the server without waiting for a response.
-- Used for asynchronous communication between server and clients.
remoteEvent:Fire(...)                                           -- Sending Method: ...
remoteEvent.OnClientEvent:Connect(function()... end)            -- Receiving Method: ...

--------------------------------------------------------------------------------------------------------

-- Remote Function:
-- Scenario: Client calls Server function and waits for response or vice versa. Synchronous communication.
local response = remoteFunction:InvokeServer(...)               -- Sending & Receiving: Client calls Server and waits for result

--------------------------------------------------------------------------------------------------------

-- Bindable Event:
-- Scenario: Asynchronous communication within the same environment (server-server or client-client).
-- Cannot cross server-client boundary.
bindableEvent:Fire(...)                                          -- Sending Method: Fire event locally
bindableEvent.Event:Connect(function(...) ... end)               -- Receiving Method: Listen for event locally

--------------------------------------------------------------------------------------------------------

-- Bindable Function:
-- Scenario: Synchronous function call within the same environment (server-server or client-client).
-- Expects and returns a value.
local result = bindableFunction:Invoke(...)                      -- Sending & Receiving: Call function and get result locally
bindableFunction.OnInvoke = function(...)                        -- Receiving & Sending: Handle call and return result locally
    -- process
    return result
end

--------------------------------------------------------------------------------------------------------