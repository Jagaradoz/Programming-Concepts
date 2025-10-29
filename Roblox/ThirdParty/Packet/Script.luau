local Packet = require(path.to.Packet)

-- ===== Remote Events =====
local myRemote = Packet("MyRemote", Packet.NumberU8, Packet.String)     -- Create a new Remote Event with data types
myRemote:FireClient(player, 123, "Hello")                               -- Fire to a specific client
myRemote:FireAllClients(123, "Hello Everyone!")                         -- Fire to all clients
myRemote.OnServerEvent:Connect(function(player, num, text)              -- Listen for incoming events from clients
    print("Received:", num, text)
end)

-- ===== Remote Functions =====
local myFunction = Packet("MyFunction", Packet.NumberU8):Response(Packet.String)    -- Create a Remote Function with response type
myFunction.ResponseTimeout = 3                                                      -- Optional: Set timeout settings
myFunction.ResponseTimeoutValue = "TimedOut"                                        -- Optional: Set timeout settings
local response = myFunction:FireClient(player, 55)                                  -- Fire function and wait for response
myFunction.OnServerEvent:Connect(function(player, num)                              -- Listen for client function calls
    return "Server Got: " .. tostring(num)
end)

-- ===== All Packet Types =====
local types = {
    "Any", "Nil",
    "NumberS8", "NumberS16", "NumberS24", "NumberS32",
    "NumberU8", "NumberU16", "NumberU24", "NumberU32",
    "NumberF16", "NumberF24", "NumberF32", "NumberF64",
    "String", "StringLong",
    "Buffer", "BufferLong",
    "Instance", "Boolean8", "NumberRange", "BrickColor",
    "Color3", "UDim", "UDim2", "Rect",
    "Vector2S16", "Vector2F24", "Vector2F32",
    "Vector3S16", "Vector3F24", "Vector3F32",
    "NumberU4", "BooleanNumber", "Boolean1",
    "CFrameF24U8", "CFrameF32U8", "CFrameF32U16",
    "Region3", "NumberSequence", "ColorSequence",
    "Characters", "EnumItem",
    "Static1", "Static2", "Static3",
}

-- Moduled by Suphi Kaner