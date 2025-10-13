-- Server:
    -- Code runs on the game server.
    -- Manages the game world, rules, data, and communication between players.
    -- Has full authority to create, modify, and delete game objects.
    -- Ensures fairness and security by controlling important logic centrally.

--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------

-- Events and Functions

-- Remote Event:
-- Scenario: Server wants to notify clients or clients want to notify the server without waiting for a response.
-- Used for asynchronous communication between server and clients.
remoteEvent:Fire(player, ...)                                   -- Sending Method: ...
remoteEvent:FireAllClients(...)                                 -- Sending(All players) Method: ...
remoteEvent:OnServerEvent:Connect(function()... end)            -- Receiving Method: ...

--------------------------------------------------------------------------------------------------------

-- Remote Function:
-- Scenario: Client calls Server function and waits for response or vice versa. Synchronous communication.
remoteFunction.OnServerInvoke = function(player, ...)           -- Receiving & Sending: Server handles call and returns a result
    -- process
    return result
end

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