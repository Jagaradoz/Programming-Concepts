local BridgeNet2 = require(path.to.BridgeNet2)

local Bridge = BridgeNet2.ClientBridge("MyEvent")           -- Create a Client Bridge (must match ServerBridge name)

Bridge:Fire("Hello Server")                                 -- Fire to server (one-way, no response)
local response = Bridge:InvokeServerAsync("Ping")           -- Invoke server (two-way, wait for response)
print("Server replied:", response)

Bridge:Connect(function(...)                                -- When server fires to client
    print("Server sent:", ...)
end)
