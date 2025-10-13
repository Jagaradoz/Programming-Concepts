local BridgeNet2 = require(path.to.BridgeNet2)


local Bridge = BridgeNet2.ServerBridge("MyEvent")                           -- Create a Server Bridge (must match ClientBridge name)

Bridge:Fire(player, "Hello Player")                                         -- Send to ONE client
Bridge:FireAll("Hello Everyone")                                            -- Send to ALL clients
Bridge:FireExcept(player, "Hello Everyone except " .. player.Name)          -- Send to ALL except one player
Bridge:FireList({player1, player2}, "Hello some players")                   -- Send to a LIST of players


Bridge:Connect(function(player, ...)                                        -- When client fires (one-way, like RemoteEvent)
    print(player.Name, "sent:", ...)
end)

Bridge.OnServerInvoke = function(player, ...)                               -- When client invokes (two-way, like RemoteFunction)
    print(player.Name, "invoked with:", ...)
    return "Response from Server"
end

Bridge:Use(function(nextFn, player, ...)                                    -- Middleware runs before processing
    print("Middleware check for", player.Name)
    return nextFn(player, ...)                                              -- MUST call nextFn to continue
end)
